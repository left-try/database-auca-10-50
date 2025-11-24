DROP VIEW IF EXISTS v_movie_ratings CASCADE;
DROP VIEW IF EXISTS v_active_subscriptions CASCADE;
DROP VIEW IF EXISTS v_user_activity_30d CASCADE;

CREATE VIEW v_active_subscriptions AS
SELECT
    s.id                AS subscription_id,
    u.id                AS user_id,
    u.email,
    u.full_name,
    sp.name             AS plan_name,
    sp.price_month,
    s.starts_on,
    s.ends_on,
    s.is_active
FROM subscription s
JOIN user_account u      ON u.id = s.user_id
JOIN subscription_plan sp ON sp.id = s.plan_id
WHERE s.is_active = TRUE
  AND CURRENT_DATE BETWEEN s.starts_on AND s.ends_on;

CREATE VIEW v_movie_ratings AS
SELECT
    m.id                    AS movie_id,
    m.title,
    COALESCE(ROUND(AVG(r.stars)::NUMERIC, 2), 0) AS avg_rating,
    COUNT(r.id)             AS vote_count
FROM movie m
LEFT JOIN rating r ON r.movie_id = m.id
GROUP BY m.id, m.title;

CREATE VIEW v_user_activity_30d AS
SELECT
    u.id                    AS user_id,
    u.email,
    u.full_name,
    COUNT(wh.id)            AS watch_events_30d
FROM user_account u
LEFT JOIN watch_history wh
       ON wh.user_id = u.id
      AND wh.watched_at >= NOW() - INTERVAL '30 days'
GROUP BY u.id, u.email, u.full_name;
