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
    conn.query("SELECT * FROM entries").map do |record|
      DiaryEntry.new(id: record['id'], title: record['title'], entry: record['entry'])
    end
  end

  def self.find(id:)
    ENV['ENVIRONMENT'] == 'test' ? env = '_test' : env = ""
    conn = PG.connect(dbname: "diary#{env}")
    record = conn.query("SELECT * FROM entries WHERE id = #{id}")
    DiaryEntry.new(id: record[0]['id'], title: record[0]['title'], entry: record[0]['entry'])
  end
end
