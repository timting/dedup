require 'sinatra'
require_relative 'deduper'
set :logging, :true

get '/' do
  erb :index
end

post '/' do
  array = request['data'].split(/\s+/)
  @dedup = Deduper.dedup(array).join("<br />")

  erb :response
end