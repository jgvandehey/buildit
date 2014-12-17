class AddAttachmentShot1ToFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.attachment :shot1
    end
  end

  def self.down
    drop_attached_file :features, :shot1
  end
end
