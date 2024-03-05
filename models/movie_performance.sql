WITH movie_revenue AS (
    SELECT
        ms.MOVIE_ID,
        ms.THEATER_ID,
        AVG(ms.TICKETS_SOLD) AS avg_tickets_sold
    FROM
        {{ ref('stg_movie_screenings') }} ms
        LEFT JOIN {{ ref('stg_movies') }} m ON ms.MOVIE_ID = m.MOVIE_ID
    GROUP BY
        ms.MOVIE_ID,
        ms.THEATER_ID
),

performance_metrics AS (
    SELECT
        m.MOVIE_ID,
        m.MOVIE_TITLE,
        t.THEATER_ID,
        t.THEATER_NAME,
        ROUND(mr.avg_tickets_sold, 2) AS avg_tickets_sold
    FROM
        {{ ref('stg_movies') }} m
        CROSS JOIN {{ ref('stg_theaters') }} t
        LEFT JOIN movie_revenue mr ON m.MOVIE_ID = mr.MOVIE_ID AND t.THEATER_ID = mr.THEATER_ID
)

SELECT
    pm.*,
    RANK() OVER (PARTITION BY pm.THEATER_ID ORDER BY pm.avg_tickets_sold DESC) AS ranking_in_theater,
    CURRENT_TIMESTAMP() AS last_updated
FROM
    performance_metrics pm
WHERE
    pm.avg_tickets_sold IS NOT NULL
