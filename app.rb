require 'sinatra'

get '/' do 
  erb :index
end

get '/lawyers' do
  erb :lawyers
end