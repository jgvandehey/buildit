class RemoveColumn < ActiveRecord::Migration
  def up
  	remove_column :features, :type, :string
  end

  def down
  end
end
