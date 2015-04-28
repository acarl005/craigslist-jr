get '/' do
  erb :welcome
end

get '/categories/:name' do
  @name = params[:name]
  erb(:"articles/splash")
end
