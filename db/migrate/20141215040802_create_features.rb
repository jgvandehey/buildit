class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.text :description
      t.string :company
      t.string :priority

      t.timestamps
    end
  end
end
