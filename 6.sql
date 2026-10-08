WITH RECURSIVE date_bounds AS (
    SELECT
        MIN(sale_date) AS first_date,
        MAX(sale_date) AS last_date
    FROM flourmills_sales
),
calendar AS (
    SELECT first_date AS sale_date, last_date
    FROM date_bounds

    UNION ALL

    SELECT sale_date + 1, last_date
    FROM calendar
    WHERE sale_date < last_date
)
SELECT COUNT(*)
FROM calendar;