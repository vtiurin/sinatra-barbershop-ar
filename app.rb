require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

set :database, 'sqlite3:barbershop.db'

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
    @barbers = Barber.order 'created_at DESC'
    erb :index
end