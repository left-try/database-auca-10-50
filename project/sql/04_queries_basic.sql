-- Basic CRUD and simple reporting queries.

-- List all movies
SELECT id, title, release_year, duration_min, age_rating
FROM movie
ORDER BY release_year DESC, title;

-- List movies with their genres
SELECT
    m.title,
    STRING_AGG(g.name, ', ' ORDER BY g.name) AS genres
FROM movie m
LEFT JOIN movie_genre mg ON mg.movie_id = m.id
LEFT JOIN genre g        ON g.id = mg.genre_id
GROUP BY m.id, m.title
ORDER BY m.title;

-- List users with their active subscription plan (if any)
SELECT
    u.id,
    u.email,
    get_active_plan(u.id) AS active_plan
FROM user_account u
ORDER BY u.id;

-- Count movies per genre
SELECT
    g.name AS genre,
    COUNT(mg.movie_id) AS movie_count
FROM genre g
LEFT JOIN movie_genre mg ON mg.genre_id = g.id
GROUP BY g.name
ORDER BY movie_count DESC;

-- Show last 5 watch history entries (basic SELECT with ORDER BY & LIMIT)
SELECT
    wh.id,
    u.email,
    m.title,
    wh.watched_at,
    wh.progress_pct,
    wh.device_type
FROM watch_history wh
JOIN user_account u ON u.id = wh.user_id
JOIN movie m        ON m.id = wh.movie_id
ORDER BY wh.watched_at DESC
LIMIT 5;
