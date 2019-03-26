require 'pg'

class Bookmarks

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @conn = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def display_all
    @conn.exec("SELECT * FROM bookmarks") do |result|
      return result.map do |row|
        row["url"]
      end
    end
  end

  def add_bookmark(url)
    @conn.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end
end
