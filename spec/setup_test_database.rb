require 'pg'

def test_db_setup

  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")
  connection.exec("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
end
