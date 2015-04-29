categories = [
  'free_and_for_sale',
  'personal',
  'housing',
  'jobs',
  'community'
]

# categories.each do |name|
#   Category.create(name: name)
# end

categories.each do |name|
  Category.where(name: name).first.articles << Article.create(title: 'fake', body: 'lorem ipsum', contact: 'Andy')
end
