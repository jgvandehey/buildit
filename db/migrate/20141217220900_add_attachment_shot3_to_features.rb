class AddAttachmentShot3ToFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.attachment :shot3
    end
  end

  def self.down
    drop_attached_file :features, :shot3
  end
end
