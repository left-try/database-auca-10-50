-- Business logic (function + trigger) and views.


CREATE OR REPLACE FUNCTION get_active_plan(p_user BIGINT)
RETURNS TEXT AS $$
DECLARE
    plan_name TEXT;
BEGIN
    SELECT sp.name
    INTO plan_name
    FROM subscription s
    JOIN subscription_plan sp ON sp.id = s.plan_id
    WHERE s.user_id = p_user
      AND s.is_active = true
    ORDER BY s.starts_on DESC
    LIMIT 1;

    RETURN plan_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION enforce_one_active_subscription()
RETURNS trigger AS $$
BEGIN
    IF NEW.is_active THEN
        PERFORM 1
        FROM subscription s
        WHERE s.user_id = NEW.user_id
          AND s.is_active = true
          AND (TG_OP = 'INSERT' OR s.id <> NEW.id);

        IF FOUND THEN
            RAISE EXCEPTION 'User % already has an active subscription', NEW.user_id;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_one_active_sub ON subscription;

CREATE TRIGGER trg_one_active_sub
BEFORE INSERT OR UPDATE ON subscription
FOR EACH ROW
EXECUTE FUNCTION enforce_one_active_subscription();


-- Active subscriptions with user and plan info
CREATE OR REPLACE VIEW v_active_subscriptions AS
SELECT
    s.id          AS subscription_id,
    u.id          AS user_id,
    u.email,
    u.full_name,
    sp.name       AS plan_name,
    sp.price_month,
    s.starts_on,
    s.ends_on
FROM subscription s
JOIN user_account u     ON u.id = s.user_id
JOIN subscription_plan sp ON sp.id = s.plan_id
WHERE s.is_active = true;

-- Average rating per movie
CREATE OR REPLACE VIEW v_movie_avg_ratings AS
SELECT
    m.id,
    m.title,
    ROUND(AVG(r.stars)::numeric, 2) AS avg_rating,
    COUNT(r.id)                     AS rating_count
FROM movie m
LEFT JOIN rating r ON r.movie_id = m.id
GROUP BY m.id, m.title;

-- Trending movies in last 7 days by unique viewers
CREATE OR REPLACE VIEW v_trending_last_7_days AS
SELECT
    m.id,
    m.title,
    COUNT(DISTINCT wh.user_id) AS unique_viewers
FROM watch_history wh
JOIN movie m ON m.id = wh.movie_id
WHERE wh.watched_at >= now() - INTERVAL '7 days'
GROUP BY m.id, m.title
ORDER BY unique_viewers DESC;
