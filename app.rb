require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

set :database, 'sqlite3:barbershop.db'

class Client < ActiveRecord::Base
end

get '/' do
    erb 'recent posts:'
end