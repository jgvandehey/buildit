class AddAttachmentShot2ToFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.attachment :shot2
    end
  end

  def self.down
    drop_attached_file :features, :shot2
  end
end
