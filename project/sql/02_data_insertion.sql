-- Populates the Movie Streaming DB with sample data.

INSERT INTO subscription_plan (name, price_month, max_devices)
VALUES
  ('Basic',    4.99, 1),
  ('Standard', 8.99, 2),
  ('Premium', 12.99, 4);

INSERT INTO user_account (email, full_name, country)
VALUES
  ('ali@example.com',     'Ali N.',       'KG'),
  ('maya@example.com',    'Maya K.',     'KZ'),
  ('john@example.com',    'John Smith',  'US'),
  ('sofia@example.com',   'Sofia Lopez', 'ES'),
  ('akmal@example.com',   'Akmal R.',    'UZ');

INSERT INTO subscription (user_id, plan_id, starts_on, ends_on, is_active)
VALUES
  (1, 2, '2025-10-01', '2025-11-01', true),
  (2, 1, '2025-10-10', '2025-11-10', true),
  (3, 3, '2025-09-15', '2025-10-15', false),
  (4, 2, '2025-10-05', '2025-11-05', true),
  (5, 3, '2025-10-20', '2025-11-20', true);

INSERT INTO genre (name)
VALUES
  ('Action'),
  ('Drama'),
  ('Comedy'),
  ('Sci-Fi'),
  ('Horror'),
  ('Animation');

INSERT INTO movie (title, release_year, duration_min, age_rating, description)
VALUES
  ('Sky Chase',        2023, 108, 'PG-13', 'High-altitude action thriller.'),
  ('Quiet Room',       2022,  95, 'R',     'Psychological drama in one location.'),
  ('Laugh Lane',       2021, 102, 'PG',    'Feel-good family comedy.'),
  ('Neon Future',      2020, 120, 'PG-13', 'Cyberpunk sci-fi with neon city.'),
  ('Night Terrors',    2019,  98, 'R',     'Classic horror with a modern twist.'),
  ('Galaxy Paws',      2024,  90, 'G',     'Animated adventure with space animals.'),
  ('Double Life',      2022, 110, 'PG-13', 'Drama about parallel timelines.'),
  ('Campus Chaos',     2021,  99, 'PG-13', 'Comedy on a university campus.');


-- Sky Chase: Action, Sci-Fi
INSERT INTO movie_genre (movie_id, genre_id) VALUES (1, 1), (1, 4);

-- Quiet Room: Drama, Horror
INSERT INTO movie_genre (movie_id, genre_id) VALUES (2, 2), (2, 5);

-- Laugh Lane: Comedy
INSERT INTO movie_genre (movie_id, genre_id) VALUES (3, 3);

-- Neon Future: Sci-Fi, Action
INSERT INTO movie_genre (movie_id, genre_id) VALUES (4, 4), (4, 1);

-- Night Terrors: Horror
INSERT INTO movie_genre (movie_id, genre_id) VALUES (5, 5);

-- Galaxy Paws: Animation, Comedy
INSERT INTO movie_genre (movie_id, genre_id) VALUES (6, 6), (6, 3);

-- Double Life: Drama, Sci-Fi
INSERT INTO movie_genre (movie_id, genre_id) VALUES (7, 2), (7, 4);

-- Campus Chaos: Comedy
INSERT INTO movie_genre (movie_id, genre_id) VALUES (8, 3);


INSERT INTO device (user_id, name, device_type)
VALUES
  (1, 'Ali Phone',      'android'),
  (1, 'Ali Laptop',     'web'),
  (2, 'Maya iPhone',    'ios'),
  (3, 'John TV',        'tv'),
  (4, 'Sofia Tablet',   'tablet'),
  (5, 'Akmal Laptop',   'web');

INSERT INTO rating (user_id, movie_id, stars)
VALUES
  (1, 1, 5),
  (1, 2, 4),
  (1, 4, 5),
  (2, 3, 5),
  (2, 6, 4),
  (3, 4, 4),
  (3, 5, 3),
  (4, 1, 4),
  (4, 6, 5),
  (5, 7, 4),
  (5, 2, 3);

INSERT INTO watch_history (user_id, movie_id, watched_at, progress_pct, device_type)
VALUES
  (1, 1, now() - INTERVAL '1 day', 100, 'web'),
  (1, 2, now() - INTERVAL '2 days',  60, 'android'),
  (1, 4, now() - INTERVAL '10 days', 100, 'web'),
  (2, 3, now() - INTERVAL '3 days', 100, 'ios'),
  (2, 6, now() - INTERVAL '5 days',  80, 'ios'),
  (3, 4, now() - INTERVAL '8 days',  90, 'tv'),
  (3, 5, now() - INTERVAL '20 days', 70, 'tv'),
  (4, 1, now() - INTERVAL '4 days',  50, 'tablet'),
  (4, 6, now() - INTERVAL '1 day',  100, 'tablet'),
  (5, 7, now() - INTERVAL '6 days',  85, 'web'),
  (5, 2, now() - INTERVAL '15 days', 40, 'web'),
  (5, 8, now() - INTERVAL '7 days', 100, 'web');
