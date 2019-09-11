# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark.rb'

# BookmarkManager inherits from Sinatra/Base
class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/confirmation' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/add' do
    erb :add
  end

end
