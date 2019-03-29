# Diary Web App

## User Stories
```As a user
So that I can keep a daily diary
I want to be able to add a new Diary Entry
```
```
As a user
So that I can identify my entry in future
I want to give each Diary Entry a title
```
```
As a user
So that I can browse my previous entries
I want to see a list of Diary Entry Titles
```
```
As a user
So that I can read my previous entries
I want to click on a title to see the full Diary Entry
```

## Domain Model

## Setting up Database for storing Bookmarks
1. `brew install postgresql`
2. `psql postgres`
3. `CREATE DATABASE "diary";`
4. `CREATE TABLE entries(id SERIAL PRIMARY KEY, title VARCHAR(60), entry VARCHAR(200));`

## Setting up a test database
1. `psql postgres`
3. `CREATE DATABASE "diary_test";`
4. `CREATE TABLE entries(id SERIAL PRIMARY KEY, title VARCHAR(60), entry VARCHAR(200));`
