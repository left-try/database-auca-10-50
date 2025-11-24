SELECT
    m.id,
    m.title,
    STRING_AGG(g.name, ', ' ORDER BY g.name) AS genres
FROM movie m
LEFT JOIN movie_genre mg ON mg.movie_id = m.id
LEFT JOIN genre g       ON g.id = mg.genre_id
GROUP BY m.id, m.title
ORDER BY m.title;

SELECT
    u.id,
    u.email,
    u.full_name,
    get_active_plan(u.id) AS active_plan
FROM user_account u
ORDER BY u.id;

SELECT
    m.id,
    m.title,
    ROUND(AVG(r.stars)::NUMERIC, 2) AS avg_rating,
    COUNT(r.id)                     AS votes
FROM movie m
JOIN rating r ON r.movie_id = m.id
GROUP BY m.id, m.title
HAVING COUNT(r.id) >= 1
ORDER BY avg_rating DESC, votes DESC
LIMIT 5;

SELECT
    g.name       AS genre,
    COUNT(*)     AS views_30d
FROM watch_history wh
JOIN movie_genre mg ON mg.movie_id = wh.movie_id
JOIN genre g        ON g.id = mg.genre_id
WHERE wh.watched_at >= NOW() - INTERVAL '30 days'
GROUP BY g.name
ORDER BY views_30d DESC;

SELECT COUNT(DISTINCT user_id) AS active_users_14d
FROM watch_history
WHERE watched_at >= NOW() - INTERVAL '14 days';

SELECT
    u.country,
    COUNT(DISTINCT u.id) AS users,
    COUNT(wh.id)         AS total_watch_events
FROM user_account u
LEFT JOIN watch_history wh ON wh.user_id = u.id
GROUP BY u.country
ORDER BY total_watch_events DESC;

SELECT
    m.id,
    m.title
FROM movie m
LEFT JOIN watch_history wh ON wh.movie_id = m.id
WHERE wh.id IS NULL
ORDER BY m.title;

SELECT
    u.id,
    u.email,
    get_active_plan(u.id) AS plan
FROM user_account u
JOIN subscription s ON s.user_id = u.id
WHERE s.is_active = TRUE
  AND CURRENT_DATE BETWEEN s.starts_on AND s.ends_on
  AND NOT EXISTS (
        SELECT 1
        FROM watch_history wh
        WHERE wh.user_id = u.id
          AND wh.watched_at >= NOW() - INTERVAL '30 days'
  )
GROUP BY u.id, u.email;

SELECT
    m.id,
    m.title,
    ROUND(AVG(wh.progress_pct)::NUMERIC, 1) AS avg_progress
FROM movie m
JOIN watch_history wh ON wh.movie_id = m.id
GROUP BY m.id, m.title
ORDER BY avg_progress DESC;

SELECT
    g.name AS genre,
    COUNT(mg.movie_id) AS movie_count
FROM genre g
LEFT JOIN movie_genre mg ON mg.genre_id = g.id
GROUP BY g.name
ORDER BY movie_count DESC, g.name;

SELECT
    device_type,
    COUNT(*) AS watch_events
FROM watch_history
GROUP BY device_type
ORDER BY watch_events DESC;

SELECT
    u.email,
    m.title,
    wh.watched_at,
    wh.progress_pct,
    wh.device_type
FROM watch_history wh
JOIN user_account u ON u.id = wh.user_id
JOIN movie m        ON m.id = wh.movie_id
ORDER BY u.email, wh.watched_at DESC;
