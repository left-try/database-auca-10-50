# Backup and Recovery Strategy

If something went wrong during the database work.

## Backup

```bash
mkdir -p backup
pg_dump -U your_user -F c -d movie_streaming -f backup/movie_streaming.dump
```
It saves to the `.dump` format which us not readable by human.

## Restore

```bash
createdb -U your_user movie_streaming_restored
pg_restore -U your_user -d movie_streaming_restored backup/movie_streaming.dump
```
You can easily restore from the `.dump` format the fully operating database.