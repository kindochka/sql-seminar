WITH ranked AS (
    SELECT invoice_no, stock_code, description, quantity, unit_price,
           DENSE_RANK() OVER (
               PARTITION BY invoice_no
               ORDER BY unit_price DESC
           ) AS price_rank
    FROM retail_sales
)
SELECT *
FROM ranked
WHERE price_rank <= 5
ORDER BY invoice_no, price_rank, stock_code;
git add .
git commit -m "uloha11"
git push