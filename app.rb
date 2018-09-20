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
    @barbers = Barber.all
    erb :index
end

before '/visit' do
    @barbers = Barber.all
end

get '/visit' do
    erb :visit
end

post '/visit' do
    client = Client.new do |c|
        c.name = params[:name]
        c.phone = params[:phone]
        c.date = params[:date]
        c.barber = params[:barber]
    end
    client.save
end