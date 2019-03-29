require 'sinatra/base'
require 'pg'
require_relative 'lib/diary_entry'

# Web app class
class DiaryApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/diary/list' do
    @list = DiaryEntry.list
    erb :'diary/list'
  end

  get '/diary/add' do
    erb :'diary/add'
  end

  post '/diary/add' do
    DiaryEntry.add(title: params[:title], entry: params[:entry])
    redirect '/diary/list'
  end

  get '/diary/view/:id' do
    @diary_entry = DiaryEntry.find(id: params[:id])
    erb :'diary/view'
  end

  run! if app_file == $0
end
