class CreatePrioritizations < ActiveRecord::Migration
  def change
    create_table :prioritizations do |t|
      t.integer :feature_id
      t.integer :company_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
