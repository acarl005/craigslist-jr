categories = [
  'Free/For Sale',
  'Personal',
  'Housing',
  'Jobs',
  'Community'
]

categories.each do |name|
  Category.create(name: name)
end
