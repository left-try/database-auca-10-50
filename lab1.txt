fum@IVANCOM-FC4Q91U:~$ sudo -u postgres psql
psql (16.9 (Ubuntu 16.9-0ubuntu0.24.04.1))
Type "help" for help.

postgres=# \l
                                                   List of databases
   Name    |  Owner   | Encoding | Locale Provider | Collate |  Ctype  | ICU Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+---------+---------+------------+-----------+-----------------------
 postgres  | postgres | UTF8     | libc            | C.UTF-8 | C.UTF-8 |            |           |
 template0 | postgres | UTF8     | libc            | C.UTF-8 | C.UTF-8 |            |           | =c/postgres          +
           |          |          |                 |         |         |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | C.UTF-8 | C.UTF-8 |            |           | =c/postgres          +
           |          |          |                 |         |         |            |           | postgres=CTc/postgres
(3 rows)

postgres=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
CREATE TABLE
postgres=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | students | table | postgres
(1 row)

postgres=# INSERT INTO students (name, age) VALUES ('Alice', 21), ('Bob', 23);
INSERT 0 2
postgres=# \d students
                                    Table "public.students"
 Column |          Type          | Collation | Nullable |               Default
--------+------------------------+-----------+----------+--------------------------------------
 id     | integer                |           | not null | nextval('students_id_seq'::regclass)
 name   | character varying(100) |           |          |
 age    | integer                |           |          |
Indexes:
    "students_pkey" PRIMARY KEY, btree (id)

postgres=# SELECT * FROM students;
 id | name  | age
----+-------+-----
  1 | Alice |  21
  2 | Bob   |  23
(2 rows)

postgres=# DROP TABLE students;
DROP TABLE
postgres=# \dt
Did not find any relations.
postgres=# \q
