get '/' do
  erb :welcome
end

get '/categories/:name' do
  category = Category.where(name: params[:name] ).first
  if category
    @articles = Article.where(category_id: category.id)
    erb(:"articles/splash")
  end
end
