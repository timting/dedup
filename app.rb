require 'sinatra'
require_relative 'dedup'
set :logging, :true

get '/' do
  erb :index
end

post '/' do
  array = request['data'].split(/\s*/)
  @dedup = Dedup.dedup(array).join("<br />")

  erb :response
end