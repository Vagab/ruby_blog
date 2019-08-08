class AddDefaultValueToUserRole < ActiveRecord::Migration[5.2]
  def up
    change_column_default :users, :role, 1
  end

  def down
    change_column_default :users, :role, nil
  end
end
