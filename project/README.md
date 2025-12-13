# Movie Streaming Database – Final Project

> I promise to meet the deadline and will take disciplinary action if this requirement is not met.
>
## Project Description

This project implements a movie streaming platform database in PostgreSQL.

The system stores and manages:

- Users and their subscription plans

- Movies and genres

- Watch history

- User ratings for movies

The database supports:

- Managing users, subscriptions, and content

- Generating reports such as:

    - Trending movies

    - Most popular genres

    - Active users

    - Users with subscriptions but low activity

The schema is normalized 3NF.

## Project structure

```text
project/
├─ sql/
│  ├─ 01_schema_creation.sql        # tables + constraints + indexes (core schema)
│  ├─ 02_data_insertion.sql         # sample dataset used for testing queries
│  ├─ 03_logic_and_views.sql        # function/trigger + reporting views
│  ├─ 04_queries_basic.sql          # CRUD + simple joins/aggregations
│  ├─ 05_queries_advanced.sql       # CTEs + window functions (analytics)
│  └─ 06_transactions_and_indexes.sql  # transactions + EXPLAIN ANALYZE examples
└─ docs/
   ├─ backup_restore.md             # pg_dump / pg_restore guide
   └─ erd.png                       # ER diagram of the schema
```
  
## Running

In psql, run:
```sql
CREATE DATABASE movie_streaming;
\c movie_streaming
\i sql/01_schema_creation.sql
\i sql/02_data_insertion.sql
\i sql/03_logic_and_views.sql
\i sql/04_queries_basic.sql
\i sql/05_queries_advanced.sql
\i sql/06_transactions_and_indexes.sql
```

## ER-Diagram

The ER-diagram shows the main tables:

- user_account, subscription_plan, subscription

- movie, genre, movie_genre

- watch_history, rating, device

and their relationships (1:N, M:N) as designed for this database.