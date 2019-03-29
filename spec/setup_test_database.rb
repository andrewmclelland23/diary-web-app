require 'pg'

def test_db_setup

  p "Setting up test database..."

  connection = PG.connect(dbname: 'diary_test')

  # Clear the bookmarks table
  connection.exec("DROP TABLE entries;")
  connection.exec("CREATE TABLE entries(id SERIAL PRIMARY KEY, title VARCHAR(60), entry VARCHAR(200));")
end
