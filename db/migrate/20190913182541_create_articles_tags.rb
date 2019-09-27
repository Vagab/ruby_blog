class CreateArticlesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_tags do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end
