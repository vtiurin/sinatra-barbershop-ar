require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

set :database, 'sqlite3:barbershop.db'

class Client < ActiveRecord::Base
    validates :name, presence: true
    validates :phone, presence: true
    validates :date, presence: true
    validates :barber, presence: true
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
    @client = Client.new
    erb :visit
end

post '/visit' do
    @client = Client.new params[:client]
    if @client.save
        erb 'Спасибо, вы записались!'
    else
        puts @client
        erb :visit
    end
end

get '/barber/:id' do
    @barber = Barber.find params[:id]
    erb :barber
end

get '/bookings' do
    @clients = Client.order 'created_at DESC'
    erb :bookings
end

get '/client/:id' do
    @client = Client.find params[:id]
    erb :client
end