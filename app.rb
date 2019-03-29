require 'sinatra/base'

# Web app class
class DiaryApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/diary/add' do
    params[:title]
  end

  run! if app_file == $0
end
