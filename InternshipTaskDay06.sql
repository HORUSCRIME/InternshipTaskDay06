-- SQL Query for monthly sales trend analysis

-- SELECT
--     DATE_TRUNC('month', TO_DATE("Date", 'YYYY-MM-DD')) AS month,
--     ROUND(SUM("Total Revenue")::numeric, 2) AS total_revenue,
--     COUNT(DISTINCT "Transaction ID") AS total_orders
-- FROM internshiptask06
-- GROUP BY month
-- ORDER BY month;


SELECT
    EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) AS year,
    EXTRACT(MONTH FROM TO_DATE("Date", 'YYYY-MM-DD')) AS month,
    ROUND(SUM("Total Revenue")::numeric, 2) AS total_revenue,
    COUNT(DISTINCT "Transaction ID") AS total_orders
FROM
    internshiptask06
WHERE
    TO_DATE("Date", 'YYYY-MM-DD') BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    year, month
ORDER BY
    year, month;
