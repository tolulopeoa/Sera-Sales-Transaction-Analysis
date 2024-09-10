*/SERA SALES PROJECT*/
SELECT * FROM sera.sales_txn LIMIT 10

SELECT transaction_date,
TO_TIMESTAMP(transaction_date, 'Mon DDth, YYYY HH:MI:SS AM') AS datetime
FROM sera.sales_txn
ORDER BY datetime DESC
LIMIT 10;
