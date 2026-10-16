WITH monthly AS (
    SELECT DATE_TRUNC('month', order_date)::date AS month,
           SUM(sales) AS monthly_sales
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),
with_prev AS (
    SELECT month,
           monthly_sales,
           LAG(monthly_sales) OVER (ORDER BY month) AS prev_month_sales
    FROM monthly
)
SELECT month,
       monthly_sales,
       prev_month_sales,
       monthly_sales - prev_month_sales AS sales_change,
       ROUND((monthly_sales - prev_month_sales) / prev_month_sales * 100, 2) AS growth_percentage
FROM with_prev
ORDER BY month;