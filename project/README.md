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

- ER-diagram is provided in docs/erd.png.

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

- Demonstrated in sql/06_transactions_and_indexes.sql:

- Transaction blocks with BEGIN, COMMIT, ROLLBACK, and SAVEPOINT

- A realistic scenario (upgrading a subscription, inserting watch events)

- Use of indexes (created in ```01_schema_creation.sql```) verified with EXPLAIN ANALYZE

Backup and recovery strategy

Documented in ```backup_restore.md```

## 3. Technology Stack

DBMS: PostgreSQL (version 12+; tested with PostgreSQL 17)

Language: SQL + PL/pgSQL (for stored function and trigger)

Tools (optional):

psql (command-line client)

pgAdmin or DBeaver for GUI administration

Git + GitHub/GitLab for version control and submission

## 4. Repository Structure

   ```
.
├── README.md
├── backup_restore.md
├── sql/
│   ├── 01_schema_creation.sql
│   ├── 02_data_insertion.sql
│   ├── 03_logic_and_views.sql
│   ├── 04_queries_basic.sql
│   ├── 05_queries_advanced.sql
│   └── 06_transactions_and_indexes.sql
└── docs/
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
- ```backup_restore.md```	Backup & Recovery Strategy	Documents how to back up and restore the database using pg_dump and pg_restore, with suggested strategies.
- ```docs/erd.png```	ER-diagram	Visual representation of entities and relationships in the database.
5. How to Run

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

For backup and restore, follow the instructions in backup_restore.md.

6. ER-Diagram

The ER-diagram for this project is located in docs/erd.png. It shows the main entities:

- UserAccount, SubscriptionPlan, Subscription

- Movie, Genre, MovieGenre

- WatchHistory, Rating, Device

and their relationships (1:N, M:N) as designed for this database.
