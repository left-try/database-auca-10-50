TRUNCATE TABLE rating RESTART IDENTITY CASCADE;
TRUNCATE TABLE watch_history RESTART IDENTITY CASCADE;
TRUNCATE TABLE movie_genre RESTART IDENTITY CASCADE;
TRUNCATE TABLE genre RESTART IDENTITY CASCADE;
TRUNCATE TABLE movie RESTART IDENTITY CASCADE;
TRUNCATE TABLE subscription RESTART IDENTITY CASCADE;
TRUNCATE TABLE subscription_plan RESTART IDENTITY CASCADE;
TRUNCATE TABLE user_account RESTART IDENTITY CASCADE;

INSERT INTO subscription_plan (name, price_month, max_devices) VALUES
('Basic',    4.99, 1),
('Standard', 8.99, 2),
('Premium', 12.99, 4);

INSERT INTO user_account (email, full_name, country, status) VALUES
('ali@example.com',   'Ali N.',    'KG', 'active'),
('maya@example.com',  'Maya K.',   'KZ', 'active'),
('john@example.com',  'John S.',   'US', 'active'),
('sara@example.com',  'Sara L.',   'DE', 'active'),
('dina@example.com',  'Dina R.',   'KG', 'blocked');

INSERT INTO subscription (user_id, plan_id, starts_on, ends_on, is_active) VALUES
(1, 2, '2025-10-01', '2025-12-01', TRUE),
(2, 1, '2025-10-15', '2025-11-30', TRUE),
(3, 3, '2025-09-01', '2025-12-01', TRUE),
(4, 1, '2025-08-01', '2025-09-01', FALSE),
(5, 1, '2025-10-01', '2025-11-01', FALSE); 

INSERT INTO genre (name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Sci-Fi'),
('Romance'),
('Horror'),
('Animation');

INSERT INTO movie (title, release_year, duration_min, age_rating, description) VALUES
('Sky Chase',        2023, 108, 'PG-13', 'High-altitude action thriller.'),
('Quiet Room',       2022, 95,  'R',     'Slow-burn psychological drama.'),
('Laugh Lane',       2021, 102, 'PG',    'Family-friendly comedy.'),
('Future Pulse',     2024, 118, 'PG-13', 'Sci-fi about time loops.'),
('Night Terrors',    2020, 99,  'R',     'Horror anthology.'),
('Love in Bishkek',  2023, 110, 'PG-13', 'Romantic story set in Bishkek.'),
('Pixel Heroes',     2019, 98,  'PG',    'Animated adventure about game characters.'),
('Cold Stars',       2022, 105, 'PG-13', 'Space drama with survival elements.'),
('Campus Chaos',     2021, 100, 'PG-13', 'Comedy on university students.'),
('Last Signal',      2024, 115, 'PG-13', 'Mystery thriller about a lost transmission.');

INSERT INTO movie_genre (movie_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 6),
(6, 2),
(6, 5),
(7, 7),
(7, 1),
(8, 4),
(8, 2),
(9, 3),
(9, 5),
(10, 1),
(10, 4);

INSERT INTO rating (user_id, movie_id, stars) VALUES
(1, 1, 5),
(1, 2, 4),
(1, 4, 5),
(2, 3, 5),
(2, 1, 4),
(3, 4, 5),
(3, 5, 3),
(4, 6, 4),
(4, 3, 3),
(2, 6, 5);

INSERT INTO watch_history (user_id, movie_id, watched_at, progress_pct, device_type) VALUES
(1, 1, NOW() - INTERVAL '1 day',   100, 'web'),
(1, 2, NOW() - INTERVAL '2 days',   45, 'android'),
(1, 4, NOW() - INTERVAL '10 days', 100, 'web'),
(2, 3, NOW() - INTERVAL '3 days',   90, 'ios'),
(2, 6, NOW() - INTERVAL '5 days',  100, 'web'),
(3, 4, NOW() - INTERVAL '20 days',  80, 'tv'),
(3, 5, NOW() - INTERVAL '40 days',  60, 'web'),
(4, 6, NOW() - INTERVAL '15 days',  70, 'android'),
(4, 3, NOW() - INTERVAL '1 day',    30, 'ios'),
(1, 3, NOW() - INTERVAL '25 days',  50, 'tablet'),
(2, 1, NOW() - INTERVAL '8 days',   60, 'web'),
(3, 8, NOW() - INTERVAL '2 days',   95, 'tv'),
(2, 9, NOW() - INTERVAL '6 days',   75, 'android'),
(1, 10, NOW() - INTERVAL '4 days',  85, 'web');
