class CreateArticles < ActiveRecord::Migration
  def change
    create_table(:articles) do |t|
      t.string(:title)
      t.string(:img_url)
      t.string(:body)
      t.string(:contact)
      t.integer(:category_id)
      t.timestamps
    end
  end
end
