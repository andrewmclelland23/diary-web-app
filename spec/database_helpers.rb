require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'diary_test')
  result = connection.query("SELECT * FROM entries WHERE id = #{id};")
  result.first
end
