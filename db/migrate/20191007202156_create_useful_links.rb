class CreateUsefulLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :useful_links do |t|
      t.string :description
      t.text :url
      t.boolean :processed

    end
  end
end
