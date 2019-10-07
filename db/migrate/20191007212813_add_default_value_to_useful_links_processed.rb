class AddDefaultValueToUsefulLinksProcessed < ActiveRecord::Migration[5.2]
  def up
    change_column_default :useful_links, :processed, false
  end

  def down
    change_column_default :useful_links, :processed, nil
  end
end
