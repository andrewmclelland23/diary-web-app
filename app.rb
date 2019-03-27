require 'sinatra/base'
require_relative 'lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

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

  get '/bookmarks/delete' do
    erb :'bookmarks/delete'
  end

  post '/bookmarks/delete' do
    Bookmarks.delete_bookmark(params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
