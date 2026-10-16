SELECT 
    o.order_id,
    c.customer_name,
    o.sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.sales > 500
ORDER BY o.sales DESC;

git add .
git commit -m "Add task 2 solution"
git push