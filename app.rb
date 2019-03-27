require 'sinatra/base'
require_relative 'lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_bookmark' do
    Bookmarks.add_bookmark(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.display_all
    erb :bookmarks
  end

  get '/delete_bookmark' do
    erb :delete_bookmark
  end

  post '/delete_bookmark' do
    Bookmarks.delete_bookmark(params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
