require 'pg'

class Bookmarks

  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.display_all
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    conn.exec("SELECT * FROM bookmarks") do |result|
      return result.map do |row|
        Bookmarks.new(row["title"], row["url"]).create_link_html
      end
    end
  end

  def self.add_bookmark(url, title)
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

  def self.delete_bookmark(title)
    ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
    conn = PG.connect(dbname: env)
    conn.exec("DELETE FROM bookmarks WHERE title='#{title}';")
  end

  def create_link_html
  "<a name='#{@title}' href='#{@url}'>#{@title}</a>"
  end


end
