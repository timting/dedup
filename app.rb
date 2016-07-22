require 'sinatra'
require_relative 'dedup'
set :logging, :true

get '/' do
  p "yoohoo"
  erb :index
end

post '/' do
  array = request['data'].split(/\s*/)
  @dedup = Dedup.dedup(array).join("<br />")

  erb :response
end