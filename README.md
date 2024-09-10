Sera Payment Analytics Project by Resagratia

This project focuses on analyzing payment transactions for Sera, a company that processes payments in multiple currencies and across different channels. Using SQL for data extraction and Tableau for visualization, the goal is to provide insights into transaction trends, revenue growth, and user activity. The project covers analysis of successful, abandoned, and failed transactions while highlighting revenue trends in both NGN and USD.

## Project Overview

This project includes:
- **SQL Analysis** to explore and query the payment data, extracting key metrics like total transactions, transaction success rates, and monthly revenue.
- **Tableau Visualization** for building an interactive dashboard to visualize the analysis results.
- **KPI Metrics** to quickly view current month revenue, subscriber counts, and percentage changes from the previous month.
- **Data Preparation** in Excel for cleaning and structuring the data before analysis.

## Tools and Technologies
- **SQL**: Used to write queries for extracting data insights.
- **Tableau**: Used to create visualizations and build dashboards.
- **Excel**: Used for data cleaning and initial preparation.
- **Figma**: Used for wireframing the dashboard layout.

## Project Structure

```
sera-payment-analytics/
│
├── data/              # Contains raw and cleaned data files
│   └── sera_data.csv
├── sql/               # Contains SQL scripts used for analysis
│   └── sera_queries.sql
├── tableau/           # Contains Tableau workbook with dashboards
│   └── sera_dashboard.twbx
├── README.md          # This file
└── LICENSE            # License file for the project
```

## Key Deliverables

1. **SQL Analysis**:
   - A series of SQL queries were used to analyze the payment transaction data, focusing on total transaction counts, revenue, and transaction success rates.
  

2. **Tableau Dashboard**:
   - The main visual deliverable is an interactive Tableau dashboard. The dashboard includes charts for revenue trends in both NGN and USD, subscriber growth, KPIs for the current month’s performance, and a map showing where payment attempts originate.
   - You can view the Tableau dashboard [[[here](https://public.tableau.com/app/profile/tolulope.okerayi/viz/Book1_17259781765270/SERASALESDASHBOARD?publish=yes)]
   - 
## Tableau Visualizations

### Key Visualizations
1. **Monthly Trend of Revenue (NGN and USD)**: 
   - This dual-axis line chart shows how revenue trends differ between NGN and USD transactions.
   
2. **Monthly Trend of Subscribers**:
   - This chart tracks the number of unique subscribers making successful payments each month.

3. **KPI Cards**:
   - These cards display the current month’s revenue, subscriber counts, and their percentage changes from the previous month.

4. **Map of Transaction Attempts**:
   - This map visualization highlights the geographical distribution of payment attempts, showing which countries users are attempting to make payments from.

5. **Channel and Card Type Analysis**:
   - This analysis shows successful payments broken down by payment channel (e.g., card, bank transfer) and card type (credit vs debit).


## How to Use the Project

### Step 1: Run SQL Queries
- The SQL queries are available in the `sql/` folder. You can run these queries on a PostgreSQL database that contains the `sera_data.csv` file.
- The queries will generate insights such as total transactions, revenue trends, and success rates.

### Step 2: Use Tableau for Visualization
- The Tableau `.twbx` file can be found in the `tableau/` folder.
- Open the file in Tableau Desktop to explore the pre-built visualizations, KPIs, and dashboards.

## Insights

- **Revenue Trends**: Revenue in NGN is significantly higher than in USD, with noticeable spikes during specific months. This can be attributed to promotions or campaigns.
- **Subscriber Growth**: There is a steady increase in subscriber counts, indicating successful efforts in user acquisition.
- **Transaction Success Rates**: Bank transfers and Mastercard debit cards have the highest success rates, while card payments have a relatively higher abandonment rate.
- **Geographical Analysis**: Most payment attempts originate from Nigeria, followed by the United States, United Kingdom, and Canada.

## Future Enhancements

- **Predictive Analytics**: Adding machine learning models to predict transaction outcomes (e.g., success or failure).
- **User Segmentation**: Further analysis to segment users based on transaction behavior and trends.
- **Churn Prediction**: Implementing models to predict customer churn based on user activity.
