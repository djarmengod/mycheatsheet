## General Notes

### Terminology and General Points to Note:
1. A PostgreSQL database cluster contains one or more named databases. 
2. Users and groups of users are shared across the entire cluster, but no other data is shared across databases. 
3. Any given client connection to the server can access only the data in a single database, the one specified in the connection request.
4. A Schema is a Namespace that contains named database objects such as tables, views, indexes, data types, functions, and operators. A Database contains  one or more named Schemas, which in turn contain Tables. Default Schema name is "public".
5. See info about Tablespaces below.
6. Schemas provide a Logical separation of data, while tablespaces provide a Physical separation.
7. Schema Search Path - When we refer to a table using just its name, PostgreSQL searches for the table by using something called a schema search path, which is a list of schemas to look in.
8. Only objects that hold data, like tables and indexes, have a tablespace clause in their CREATE statement. A schema does not have an associated data file.
9. If you want the tables that live in different schemas to reside in different tablespaces, you'll have to add a tablespace clause to each CREATE TABLE and CREATE INDEX statement.
10. If the applications need to access each other's data, put them in different schemas in one database. Otherwise use two databases to ensure that they cannot mess with each other's data.


### Table Spaces
```
A tablespace is a location on disk where PostgreSQL stores data files containing database objects e.g., indexes., and tables. 
PostgreSQL uses a tablespace to map a logical name to a physical location on disk.
PostgreSQL comes with two default tablespaces:
1. pg_defaulttablespace stores all user data.
2. pg_globaltablespace stores all global data.

Uses:
You can place the frequent access indexes or tables on devices that perform very fast e.g., solid state devices. 
AND 
Put the tables containing archive data which is rarely used on slower devices.

CREATE TABLESPACE ssdtablespace LOCATION 'y:\ssdmount\tier1';
```

### Schemas
```
Several scenarios which you want to use schemas:

1. Schemas allow you to organize database objects e.g., tables into logical groups to make them more manageable.
2. Schemas enable multiple users to use one database without interfering with each other.

PostgreSQL creates a schema named public for every new database. Whatever object you create without specifying the schema name, PostgreSQL will automatically put it into this public schema. 

Users can only access objects in the schemas that they own. It means they cannot access any object in the schemas, which does not belong to them. To enable users to access the objects in the schema that they do not own, you must grant the USAGE privilege to the users on the schema as shown in the following statement:

GRANT USAGE ON SCHEMA schema_name TO user_name;

To allow users to create objects in the schema that they do not own, you need to grant them the CREATE privilege on the schema.

GRANT CREATE ON SCHEMA schema_name TO user_name;

```

### CLI Related

PSQL CLI
```
psql -U postgres
```
Connect to DB
```
\c nsedb
```

Current Schema
```
SELECT current_schema();
```

Update Schema Search Path
```
SET search_path TO userschema, public;
```

```
| List databases along with their tablespace names | \l+ |
| List users | \du |
| List schemas | \dn |
| List tables | \dt |
| Find database size | SELECT pg_size_pretty( pg_database_size('jira') ); |
| Create Role | CREATE USER "INSERT_USERNAME" WITH LOGIN ENCRYPTED PASSWORD 'INSERT_PASSWORD' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity'; |
| Create DB with custom encoding and collation | CREATE DATABASE "INSERT_DBNAME" WITH OWNER = "INSERT_DBOWNER" ENCODING = 'UTF8' LC_COLLATE = 'en_AU.UTF-8' LC_CTYPE = 'en_AU.UTF-8' TABLESPACE = pg_default CONNECTION LIMIT = 40; |
| Grant Connect | GRANT SELECT ON ALL TABLES IN SCHEMA public TO INSERT_USERNAME; |
| Identify the collation type for each database | select datname, datcollate from pg_database; |
| Pause DB replication | select pg_xlog_replay_pause() |
| Resume DB replication | select pg_xlog_replay_resume() |
| Dump/Export database | pg_dump --host PgSQLDumpDB.dbHostIP --port PgSQLDumpDB.dbListenPort --username PgSQLDumpDB.dbUserName --no-password --format plain --blobs --verbose  --file=../output/+PgSQLDumpDB.dbName+_dbDump_original.sql PgSQLDumpDB.dbName |
| List schemas | \dn |
| Install pgbench | yum install postgresql-contrib |
| Install postgresql server | yum install postgresql-server && postgresql-setup initdb && systemctl enable postgresql.service && systemctl start postgresql.service |
| Create a populate tables for benchmark tests | pgbench -i -s 50 dockertest |
| Run benchmark test with 10 clients and 2 workers | pgbench -c 10 -j 2 -t 10000 dockertest |
```
