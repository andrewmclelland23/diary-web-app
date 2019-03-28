require 'sinatra/base'
require_relative 'lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  post '/bookmarks/add' do
    Bookmarks.add_bookmark(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.display_all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete_bookmark(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
