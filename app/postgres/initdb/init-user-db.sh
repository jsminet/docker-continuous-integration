#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE gogs;
	CREATE DATABASE sonarqube;

	CREATE USER gogs PASSWORD 'gogs';
	CREATE USER sonarqube PASSWORD 'sonarqube';
	
	\c gogs
	CREATE SCHEMA AUTHORIZATION gogs;
	
	\c sonarqube
	CREATE SCHEMA AUTHORIZATION sonarqube;
EOSQL