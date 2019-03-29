require 'pg'

class DiaryEntry

  attr_reader :title, :entry, :id

  def initialize(title:, entry:, id:)
    @title = title
    @entry = entry
    @id = id
  end

  def self.add(title:, entry:)
    ENV['ENVIRONMENT'] == 'test' ? env = '_test' : env = ""
    conn = PG.connect(dbname: "diary#{env}")
    result = conn.exec("INSERT INTO entries (title, entry) VALUES ('#{title}', '#{entry}') RETURNING id, title, entry")
    DiaryEntry.new(id: result[0]['id'], title: result[0]['title'], entry: result[0]['entry'])
  end

  def self.list
    ENV['ENVIRONMENT'] == 'test' ? env = '_test' : env = ""
    conn = PG.connect(dbname: "diary#{env}")
    result = conn.query("SELECT title FROM entries").map { |record| record['title'] }
  end
end
