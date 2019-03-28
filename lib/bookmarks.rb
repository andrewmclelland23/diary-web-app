require 'pg'

class Bookmarks

  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  def self.display_all
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    conn.exec("SELECT * FROM bookmarks") do |result|
      return result.map do |row|
        Bookmarks.new(row["title"], row["url"], row["id"])
      end
    end
  end

  def self.add_bookmark(url, title)
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmarks.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end

  def self.delete_bookmark(id:)
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    conn.exec("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update_bookmark(title:, url:, id:)
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    conn.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}'")
  end

  def self.find(id:)
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    result = conn.exec("Select * FROM bookmarks WHERE id = #{id};")
    Bookmarks.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end
end
