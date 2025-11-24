# Movie Streaming Database – Final Project

I promise to meet the deadline and will take disciplinary action if this requirement is not met.

## 1. Project Description

This project is a **movie streaming platform database**.  
It stores information about:

- Users and their subscription plans
- Movies and genres
- Watch history (who watched what and when)
- User ratings for movies

The database supports:

- Managing users and subscriptions
- Generating reports such as:
  - Trending movies
  - Most popular genres
  - Active users
  - Users with subscription but low activity


## 2. Technology

- **DBMS:** PostgreSQL (version 12+ recommended)
- **Language:** SQL + PL/pgSQL (for function/trigger)


## 3. Files

- `schema.sql` – creates all tables and indexes
- `logic.sql` – business logic (function + trigger)
- `views.sql` – predefined views
- `seed.sql` – sample data
- `queries.sql` – example reporting queries


## 4. How to Run

In `psql`:

```bash
CREATE DATABASE movie_streaming;
\c movie_streaming

-- 1) Create tables
\i schema.sql

-- 2) Create function and trigger
\i logic.sql

-- 3) Create views
\i views.sql

-- 4) Insert sample data
\i seed.sql

-- 5) Run example queries
\i queries.sql
