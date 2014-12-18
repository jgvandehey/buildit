class Feature < ActiveRecord::Base
  attr_accessible :company, :description, :name, :priority, :shot1, :shot2, :shot3
  belongs_to :user
  validates :user_id, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
  has_attached_file :shot1, styles: { medium: "100%"}
  has_attached_file :shot2, styles: { medium: "100%"}
  has_attached_file :shot3, styles: { medium: "100%"}
  has_many :comments, as: :commentable
end
