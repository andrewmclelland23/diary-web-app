require 'sinatra/base'
require 'pg'

# Web app class
class DiaryApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/diary/list' do
    ENV['ENVIRONMENT'] == 'test' ? conn = PG.connect(dbname: 'diary_test') : conn = PG.connect(dbname: 'diary')
    conn.query("SELECT title FROM entries").map { |record| record['title'] }
  end

  get '/diary/add' do
    erb :add_entry
  end

  post '/diary/add' do
    ENV['ENVIRONMENT'] == 'test' ? conn = PG.connect(dbname: 'diary_test') : conn = PG.connect(dbname: 'diary')
    conn.exec("INSERT INTO entries (title, entry) VALUES ('#{params[:title]}', '#{params[:entry]}')")
    redirect '/diary/list'
  end

  run! if app_file == $0
end
