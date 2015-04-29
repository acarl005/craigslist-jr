get '/' do
  erb(:welcome)
end

get '/new' do
  @article = Article.new
  erb(:"articles/new")
end

post '/articles' do
  @article = Article.new(
    title: params[:title],
    img_url: params[:img_url],
    body: params[:body],
    contact: params[:contact],
    category_id: params[:category],
  )
  if @article.save
    redirect(:"/articles/received/#{params[:category]}")
  else
    erb(:"articles/new")
  end
end

get '/articles/received/:id' do
  @category = Category.find(params[:id]).name
  erb(:"articles/received")
end

get '/articles/:id' do
  @article = Article.find(params[:id])
  erb(:"articles/display")
end

get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  erb(:"articles/edit")
end

put '/articles/:id' do
  @article = Article.find(params[:id])
  @article[:title] = params[:title]
  @article[:img_url] = params[:img_url]
  @article[:body] = params[:body]
  @article[:contact] = params[:contact]
  if @article.save
    redirect(:"/articles/received/#{@article.category.id}")
  else
    erb(:"articles/edit")
  end
end

delete '/articles/:id' do
  @article = Article.find(params[:id])
  @category = @article.category.name
  @article.destroy
  erb(:"articles/deleted")
end

get '/categories/:name' do
  category = Category.where(name: params[:name]).first
  if category
    @articles = Article.where(category_id: category.id)
    erb(:"articles/splash")
  end
end
