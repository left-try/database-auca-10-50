DROP TABLE IF EXISTS rating CASCADE;
DROP TABLE IF EXISTS watch_history CASCADE;
DROP TABLE IF EXISTS movie_genre CASCADE;
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS movie CASCADE;
DROP TABLE IF EXISTS subscription CASCADE;
DROP TABLE IF EXISTS subscription_plan CASCADE;
DROP TABLE IF EXISTS user_account CASCADE;

CREATE TABLE user_account (
    id          BIGSERIAL PRIMARY KEY,
    email       TEXT NOT NULL UNIQUE,
    full_name   TEXT NOT NULL,
    country     TEXT,
    status      TEXT NOT NULL DEFAULT 'active'
                    CHECK (status IN ('active', 'blocked')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE subscription_plan (
    id           BIGSERIAL PRIMARY KEY,
    name         TEXT NOT NULL UNIQUE,
    price_month  NUMERIC(8,2) NOT NULL CHECK (price_month >= 0),
    max_devices  INT NOT NULL CHECK (max_devices > 0)
);

CREATE TABLE subscription (
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT NOT NULL REFERENCES user_account(id) ON DELETE CASCADE,
    plan_id    BIGINT NOT NULL REFERENCES subscription_plan(id),
    starts_on  DATE NOT NULL,
    ends_on    DATE NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_subscription_dates CHECK (starts_on < ends_on)
);

CREATE TABLE movie (
    id           BIGSERIAL PRIMARY KEY,
    title        TEXT NOT NULL,
    release_year INT CHECK (
        release_year BETWEEN 1900 AND EXTRACT(YEAR FROM CURRENT_DATE)::INT
    ),
    duration_min INT NOT NULL CHECK (duration_min > 0),
    age_rating   TEXT CHECK (age_rating IN ('G','PG','PG-13','R','NC-17')),
    description  TEXT
);

CREATE TABLE genre (
    id    BIGSERIAL PRIMARY KEY,
    name  TEXT NOT NULL UNIQUE
);

CREATE TABLE movie_genre (
    movie_id BIGINT NOT NULL REFERENCES movie(id) ON DELETE CASCADE,
    genre_id BIGINT NOT NULL REFERENCES genre(id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, genre_id)
);

CREATE TABLE watch_history (
    id           BIGSERIAL PRIMARY KEY,
    user_id      BIGINT NOT NULL REFERENCES user_account(id) ON DELETE CASCADE,
    movie_id     BIGINT NOT NULL REFERENCES movie(id) ON DELETE CASCADE,
    watched_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    progress_pct INT NOT NULL CHECK (progress_pct BETWEEN 0 AND 100),
    device_type  TEXT CHECK (device_type IN ('web','android','ios','tv','tablet'))
);

CREATE TABLE rating (
    id        BIGSERIAL PRIMARY KEY,
    user_id   BIGINT NOT NULL REFERENCES user_account(id) ON DELETE CASCADE,
    movie_id  BIGINT NOT NULL REFERENCES movie(id) ON DELETE CASCADE,
    stars     INT NOT NULL CHECK (stars BETWEEN 1 AND 5),
    rated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_user_movie_rating UNIQUE (user_id, movie_id)
);

CREATE INDEX idx_wh_user_time
    ON watch_history (user_id, watched_at DESC);

CREATE INDEX idx_wh_movie_time
    ON watch_history (movie_id, watched_at DESC);

CREATE INDEX idx_sub_user_active
    ON subscription (user_id, is_active);

CREATE INDEX idx_rating_movie
    ON rating (movie_id);
