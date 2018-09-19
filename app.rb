require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
    erb 'recent posts:'
end