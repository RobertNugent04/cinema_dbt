-- models/movie_performance.sql

WITH movie_revenue AS (
    SELECT
        ms.MOVIE_ID,
        ms.THEATER_ID,
        AVG(ms.TICKETS_SOLD) AS avg_tickets_sold
    FROM
        RAW_2.CINEMA.MOVIE_SCREENINGS ms
        LEFT JOIN RAW_2.CINEMA.MOVIES m ON ms.MOVIE_ID = m.MOVIE_ID
    GROUP BY
        ms.MOVIE_ID,
        ms.THEATER_ID
),

performance_metrics AS (
    SELECT
        m.MOVIE_ID,
        m.TITLE,
        t.THEATER_ID,
        t.THEATER_NAME,
        t.LOCATION,
        t.CAPACITY,
        ROUND(mr.avg_tickets_sold, 2) AS avg_tickets_sold
    FROM
        RAW_2.CINEMA.MOVIES m
        CROSS JOIN RAW_2.CINEMA.THEATERS t
        LEFT JOIN movie_revenue mr ON m.MOVIE_ID = mr.MOVIE_ID AND t.THEATER_ID = mr.THEATER_ID
)

SELECT
    pm.*,
    RANK() OVER (PARTITION BY pm.THEATER_ID ORDER BY pm.avg_tickets_sold DESC) AS ranking_in_theater
FROM
    performance_metrics pm
WHERE
    pm.avg_tickets_sold IS NOT NULL
