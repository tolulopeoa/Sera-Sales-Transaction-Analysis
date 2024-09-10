SELECT * FROM sera.sales
--Questions--
	
--How many transactions occurred?--
SELECT COUNT(*) AS total_transactions
FROM sera.sales;

--What is the period covered in the analysis?--
SELECT
	MIN(datetime) AS start_date,
	MAX(datetime) AS end_date
FROM sera.sales;

--Show the transaction count by status and percentage of total for each status.--
SELECT
	status,
	COUNT(*) AS txn_count,
	ROUND((COUNT(*)* 100.0 / SUM(COUNT(*)) OVER()),2) AS percentage
FROM sera.sales
GROUP BY status;

--Show the monthly subscription revenue in NGN split by channel. Assume that the current exchange rate NGN/USD is 1500. Ensure to round up the output for a neater presentation. Which month-year had the highest revenue? What trend do you generally notice?--
SELECT
	DATE_TRUNC('month', datetime) AS monthly_sub,
	channel,
	ROUND(SUM(CASE WHEN status = 'success' THEN amount ELSE 0 END), 2) AS total_revenue_ngn,
	ROUND(SUM(CASE WHEN status = 'success' THEN amount ELSE 0 END)/ 1500, 2) AS total_revenue_usd
FROM sera.sales
GROUP BY monthly_sub, channel
ORDER BY monthly_sub, channel;

-- Which month-year had the highest revenue--
SELECT
	DATE_TRUNC('month', datetime) AS highest_monthly_sub,
	ROUND(SUM(CASE WHEN status = 'success' THEN amount ELSE 0 END),2) AS total_revenue_ngn
FROM sera.sales
GROUP BY highest_monthly_sub
ORDER BY total_revenue_ngn DESC
LIMIT 1;

--Show the total transactions by channel split by the transaction status. Which channel has the highest rate of success? Which has the highest rate of failure?--
SELECT
	channel,
	status,
	COUNT(*) AS count
FROM sera.sales
GROUP BY channel, status
ORDER BY channel, status;

--How many subscribers are there in total? A subscriber is a user with a successful payment.--
SELECT
	COUNT(DISTINCT user_id) AS total_subscribers
FROM sera.sales
WHERE status = 'success';

--A user is active within a month when there is an attempt to subscribe. Generate a list of users showing their number of active months, total successful, abandoned, and failed transactions. 
WITH user_activity AS (
	SELECT
		user_id,
		DATE_TRUNC ('month', datetime) AS month,
		COUNT(*) AS total_transactions,
		SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END)AS successful_transactions,
		SUM(CASE WHEN status = 'abandoned' THEN 1 ELSE 0 END) AS abandoned_transactions,
		SUM(CASE WHEN status = 'failed' THEN 1 ELSE 0 END) AS failed_transactions
	FROM sera.sales
	GROUP BY user_id, month
)
SELECT 
	user_id,
	COUNT(month) AS active_months,
	SUM(successful_transactions) AS total_successful_transactions,
	SUM(abandoned_transactions) AS total_abandoned_transactions,
	SUM(failed_transactions) AS total_failed_transactions
FROM user_activity
GROUP BY user_id
ORDER BY active_months DESC;

--Identify the users with more than 1 active month without a successful transaction--
WITH user_activity AS (
	SELECT
		user_id,
		DATE_TRUNC('month', datetime) AS month,
		SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END) AS successful_transactions
	FROM sera.sales
	GROUP BY user_id, month
)
SELECT
	user_id,
	COUNT(month) AS active_months
FROM user_activity
WHERE successful_transactions = 0
GROUP BY user_id
HAVING COUNT(month) > 1
ORDER BY active_months DESC;
