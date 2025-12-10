# Movie Streaming Database – Final Project

> I promise to meet the deadline and will take disciplinary action if this requirement is not met.
>
## 1. Project Description

This project implements a movie streaming platform database in PostgreSQL.

The system stores and manages:

- Users and their subscription plans

- Movies and genres (many-to-many)

- Watch history (who watched what, when, and on which device)

- User ratings for movies (1–5 stars)

The database supports:

- Managing users, subscriptions, and content

- Generating reports such as:

    - Trending movies

    - Most popular genres

    - Active users

    - Users with subscriptions but low activity

- Demonstrating transactions, indexing, and backup/restore

The schema is normalized (at least 3NF) and described by an ER-diagram.

## 2. Course Requirements Mapping

This project is designed to satisfy the final project requirements for the Database course:

- Database schema and ER-diagram

- Schema is defined in ```sql/01_schema_creation.sql```.

- ER-diagram is provided in docs/```erd.png```.

Tables include:

- user_account, subscription_plan, subscription

- movie, genre, movie_genre

- watch_history, rating, device

- Normalization and relationships are explained in the project report (docs/report.md, optional).

- Implementation in PostgreSQL

All scripts are written for PostgreSQL (version 12+ recommended).

The database can be created and fully populated using only the SQL files in the sql/ directory.

SQL queries

- Basic queries: ```sql/04_queries_basic.sql```

- Simple SELECT, INSERT, UPDATE, DELETE

- Joins between tables (e.g., movies with genres, users with plans)

- Basic aggregations (GROUP BY)

- Advanced queries: ```sql/05_queries_advanced.sql```

- CTE (Common Table Expressions) using WITH

- Window functions (e.g., RANK() over average ratings)

More complex analytical queries (trending movies, churn risk, etc.)

- Transactions and indexing demonstration

- Demonstrated in ```sql/06_transactions_and_indexes.sql```:

    - Transaction blocks with BEGIN, COMMIT, ROLLBACK, and SAVEPOINT

    - A realistic scenario (upgrading a subscription, inserting watch events)

- Use of indexes (created in ```01_schema_creation.sql```) verified with EXPLAIN ANALYZE

- Backup and recovery strategy

    - Documented in ```docs/backup_restore.md```

## 3. Technology Stack

DBMS: PostgreSQL (version 12+; tested with PostgreSQL 17)

Language: SQL + PL/pgSQL (for stored function and trigger)

## 4. Repository Structure

   ```
.
├── README.md
├── sql/
│   ├── 01_schema_creation.sql
│   ├── 02_data_insertion.sql
│   ├── 03_logic_and_views.sql
│   ├── 04_queries_basic.sql
│   ├── 05_queries_advanced.sql
│   └── 06_transactions_and_indexes.sql
└── docs/
    ├── backup_restore.md
    └── erd.png
```

File Overview
File	Title	Purpose / Key Demonstrations
- ```sql/01_schema_creation.sql```	Schema Creation (DDL)	Creates all core tables, primary & foreign keys, CHECK constraints, and indexes.
- ```sql/02_data_insertion.sql```	Sample Data Insertion (DML)	Populates tables with realistic test data: users, movies, genres, plans, watch history, ratings.
- ```sql/03_logic_and_views.sql```	Business Logic & Views	Defines stored function (get_active_plan), trigger (trg_one_active_sub) and views (v_active_subscriptions, v_movie_avg_ratings, v_trending_last_7_days) used for reporting and simplification.
- ```sql/04_queries_basic.sql```	Basic Queries	Demonstrates CRUD operations, simple joins, filters, and basic aggregation.
- ```sql/05_queries_advanced.sql```	Advanced Queries	Uses CTEs, window functions, and more complex analytical queries.
- ```sql/06_transactions_and_indexes.sql```	Transactions & Indexing Demonstration	Shows ACID transactions, SAVEPOINT, and index usage via EXPLAIN ANALYZE.
- ```docs/backup_restore.md```	Backup & Recovery Strategy	Documents how to back up and restore the database using pg_dump and pg_restore, with suggested strategies.
- ```docs/erd.png```	ER-diagram	Visual representation of entities and relationships in the database.
  
## 5. How to Run

Open psql and execute the files in order:
```
-- 0) Create and connect to the database
CREATE DATABASE movie_streaming;
\c movie_streaming

-- 1) Create the schema (tables, constraints, indexes)
\i sql/01_schema_creation.sql

-- 2) Insert sample data
\i sql/02_data_insertion.sql

-- 3) Create business logic (function, trigger) and views
\i sql/03_logic_and_views.sql

-- 4) Run basic queries
\i sql/04_queries_basic.sql

-- 5) Run advanced queries
\i sql/05_queries_advanced.sql

-- 6) Demonstrate transactions and index usage
\i sql/06_transactions_and_indexes.sql
```

For backup and restore, follow the instructions in ```docs/backup_restore.md```.

## 6. ER-Diagram

The ER-diagram for this project is located in ```docs/erd.png```. It shows the main entities:

- UserAccount, SubscriptionPlan, Subscription

- Movie, Genre, MovieGenre

- WatchHistory, Rating, Device

and their relationships (1:N, M:N) as designed for this database.

## 7. How to Test

Requirements
- PostgreSQL is installed and `psql`/`pg_restore` are on your PATH.
- You have access to a PostgreSQL superuser (often `postgres`) or a user with CREATE DATABASE privileges.
- Repository root: `C:\Users\leres\database-auca-10-50` (adjust `$root` if different).

1) Create the database and load SQL (PowerShell)

```powershell
# create DB (run as postgres or a superuser)
psql -U postgres -c "CREATE DATABASE movie_streaming;"

$root = 'C:\Users\leres\database-auca-10-50'

psql -U postgres -d movie_streaming -f "$root\project\sql\01_schema_creation.sql"
psql -U postgres -d movie_streaming -f "$root\project\sql\02_data_insertion.sql"
psql -U postgres -d movie_streaming -f "$root\project\sql\03_logic_and_views.sql"
psql -U postgres -d movie_streaming -f "$root\project\sql\04_queries_basic.sql"
psql -U postgres -d movie_streaming -f "$root\project\sql\05_queries_advanced.sql"
psql -U postgres -d movie_streaming -f "$root\project\sql\06_transactions_and_indexes.sql"
```


2) Quick verification queries

Connect to the database and run these checks to confirm schema and data were loaded correctly.

```sql
-- list tables
\dt

-- basic counts
SELECT COUNT(*) AS users FROM user_account;
SELECT COUNT(*) AS movies FROM movie;
SELECT COUNT(*) AS genre_links FROM movie_genre;
SELECT COUNT(*) AS watch_events FROM watch_history;

-- sample views/results
SELECT * FROM v_active_subscriptions LIMIT 5;
SELECT * FROM v_movie_avg_ratings ORDER BY avg_rating DESC NULLS LAST LIMIT 5;
SELECT * FROM v_trending_last_7_days LIMIT 10;

-- function / trigger / index checks
SELECT proname FROM pg_proc WHERE proname = 'get_active_plan';
SELECT tgname FROM pg_trigger WHERE tgname = 'trg_one_active_sub';
SELECT indexname, indexdef FROM pg_indexes WHERE schemaname = 'public' ORDER BY indexname LIMIT 20;
```

3) Optional automated assertions (run inside `psql -d movie_streaming -c "..."`)

```sql
DO $$
BEGIN
    IF (SELECT COUNT(*) FROM movie) = 0 THEN RAISE EXCEPTION 'No movies inserted'; END IF;
    IF (SELECT COUNT(*) FROM user_account) = 0 THEN RAISE EXCEPTION 'No users inserted'; END IF;
END
$$;
```

4) Restoring provided backups

The repository includes several backups in `lab15/pg_backups`. Use `psql` for plain `.sql` files and `pg_restore` for custom-format `.dump` files.

Examples (PowerShell):

```powershell
# plain SQL
psql -U postgres -d movie_streaming -f "C:\Users\leres\database-auca-10-50\lab15\pg_backups\backup.sql"

# custom-format dump
pg_restore -U postgres -d movie_streaming -v "C:\Users\leres\database-auca-10-50\lab15\pg_backups\backup.dump"

# full-cluster dumps may require --create and restoring to the 'postgres' database
pg_restore -U postgres --clean --create -d postgres "C:\Users\leres\database-auca-10-50\lab15\pg_backups\full_postgres.dump"
```

5) Docker alternative

If you don't want to install PostgreSQL locally, you can run a container and execute the same `psql` commands inside it. For example:

```powershell
docker run -d --name pg-local -e POSTGRES_PASSWORD=mysecret -p 5432:5432 -v "$env:USERPROFILE\database-auca-10-50:/workspace" postgres:17
docker exec -it pg-local psql -U postgres -c "CREATE DATABASE movie_streaming;"
docker exec -it pg-local psql -U postgres -d movie_streaming -f /workspace/project/sql/01_schema_creation.sql
```