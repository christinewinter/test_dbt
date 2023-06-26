SELECT
    c.customer_id,
    SUM(p.amount) AS total_revenue,
    COUNT(DISTINCT p.payment_id) AS total_transactions,
    AVG(p.amount) AS average_transaction_value,
    (SUM(p.amount) / COUNT(DISTINCT p.payment_id)) * (SELECT AVG(lifespan) FROM (
        SELECT p.customer_id, DATE_PART('day', MAX(p.payment_date) - MIN(p.payment_date)) AS lifespan
        FROM payment AS p
        GROUP BY p.customer_id
    ) AS subquery) AS clv
FROM
    payment AS p
JOIN
    customer AS c ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id