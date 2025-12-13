# Backup and Recovery Strategy

## Backup

```bash
mkdir -p backup
pg_dump -U your_user -F c -d movie_streaming -f backup/movie_streaming.dump
```

## Restore

```bash
createdb -U your_user movie_streaming_restored
pg_restore -U your_user -d movie_streaming_restored backup/movie_streaming.dump
```