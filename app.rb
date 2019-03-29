require 'sinatra/base'
require 'pg'

# Web app class
class DiaryApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/diary/list' do
    DiaryEntry.list
  end

  get '/diary/add' do
    erb :add_entry
  end

  post '/diary/add' do
    DiaryEntry.add(title: params[:title], entry: params[:entry])
    redirect '/diary/list'
  end

  run! if app_file == $0
end
