-- Advanced SQL queries: CTEs, window functions, more complex analytics.

-- Q1: Trending movies (last 7 days) using the view
SELECT *
FROM v_trending_last_7_days;

-- Q2: Most watched genres in the last 30 days
SELECT
    g.name AS genre,
    COUNT(*) AS views
FROM watch_history wh
JOIN movie_genre mg ON mg.movie_id = wh.movie_id
JOIN genre g        ON g.id = mg.genre_id
WHERE wh.watched_at >= now() - INTERVAL '30 days'
GROUP BY g.name
ORDER BY views DESC;

-- Q3: Users with active subscription but no watch history in the last 30 days
SELECT
    u.id,
    u.email,
    get_active_plan(u.id) AS active_plan
FROM user_account u
JOIN subscription s ON s.user_id = u.id AND s.is_active = true
LEFT JOIN watch_history wh
    ON wh.user_id = u.id
   AND wh.watched_at >= now() - INTERVAL '30 days'
WHERE wh.id IS NULL
GROUP BY u.id, u.email
ORDER BY u.id;

-- Q4: CTE example – recent watches then aggregated by movie
WITH recent_watches AS (
    SELECT *
    FROM watch_history
    WHERE watched_at >= now() - INTERVAL '14 days'
)
SELECT
    m.title,
    COUNT(rw.id) AS recent_views
FROM recent_watches rw
JOIN movie m ON m.id = rw.movie_id
GROUP BY m.id, m.title
ORDER BY recent_views DESC;

-- Q5: Window function – rank movies by average rating
SELECT
    title,
    avg_rating,
    rating_count,
    RANK() OVER (ORDER BY avg_rating DESC) AS rating_rank
FROM v_movie_avg_ratings
WHERE rating_count >= 1
ORDER BY rating_rank;

-- Q6: Average watch progress per movie, sorted by progress
SELECT
    m.title,
    ROUND(AVG(wh.progress_pct)::numeric, 2) AS avg_progress,
    COUNT(*) AS views
FROM movie m
JOIN watch_history wh ON wh.movie_id = m.id
GROUP BY m.id, m.title
ORDER BY avg_progress DESC;
