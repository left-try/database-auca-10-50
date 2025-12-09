-- Demonstrates transactions (ACID) and index usage with EXPLAIN ANALYZE.

-- Scenario 1: upgrade a user's subscription plan in a transaction.

BEGIN;

SELECT s.id, s.user_id, s.plan_id, s.starts_on, s.ends_on, s.is_active
FROM subscription s
WHERE s.user_id = 1
ORDER BY s.starts_on DESC;

UPDATE subscription
SET is_active = false
WHERE user_id = 1
  AND is_active = true;

INSERT INTO subscription (user_id, plan_id, starts_on, ends_on, is_active)
VALUES (1, 3, CURRENT_DATE, CURRENT_DATE + INTERVAL '30 days', true);

SELECT s.id, s.user_id, s.plan_id, s.starts_on, s.ends_on, s.is_active
FROM subscription s
WHERE s.user_id = 1
ORDER BY s.starts_on DESC;

COMMIT;

-- Scenario 2: record several watch events, then rollback one of them using SAVEPOINT.

BEGIN;

INSERT INTO watch_history (user_id, movie_id, progress_pct, device_type)
VALUES (2, 1, 30, 'ios');

SAVEPOINT sp_after_first;

INSERT INTO watch_history (user_id, movie_id, progress_pct, device_type)
VALUES (2, 2, 50, 'ios');

ROLLBACK TO SAVEPOINT sp_after_first;

SELECT * FROM watch_history
WHERE user_id = 2
ORDER BY watched_at DESC
LIMIT 5;

COMMIT;


EXPLAIN ANALYZE
SELECT *
FROM watch_history
WHERE user_id = 1
ORDER BY watched_at DESC
LIMIT 10;
