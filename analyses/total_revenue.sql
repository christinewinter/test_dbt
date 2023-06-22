SELECT EXTRACT(YEAR FROM payment_date) AS year, SUM(amount) AS total_revenue
FROM payment
GROUP BY EXTRACT(YEAR FROM payment_date);