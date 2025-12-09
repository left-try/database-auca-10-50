# Backup and Recovery Strategy – Movie Streaming Database

## 1. Backup with pg_dump

### Assumptions:

Database name: movie_streaming

PostgreSQL user: your_user

### 1.1 Full logical backup (custom format)

```
pg_dump -U your_user -F c -d movie_streaming -f movie_streaming_backup.dump
```

```-F c``` – custom compressed format

```-f``` – output file path

Includes schema (tables, constraints, indexes, views, functions) and data.

### 1.2 Plain SQL backup (optional)

```
pg_dump -U your_user -d movie_streaming > movie_streaming_backup.sql
```

This produces a text file with all CREATE TABLE and INSERT statements.

## 2. Restore Strategy

### 2.1 Restore from custom-format backup

Create an empty database:

```
createdb -U your_user movie_streaming_restored
```

Restore into it:

```
pg_restore -U your_user -d movie_streaming_restored movie_streaming_backup.dump
```

Now movie_streaming_restored should contain the same schema and data as the original database.

### 2.2 Restore from plain SQL backup

```
createdb -U your_user movie_streaming_restored_sql
psql -U your_user -d movie_streaming_restored_sql -f movie_streaming_backup.sql
```