class Feature < ActiveRecord::Base
  attr_accessible :company, :description, :name, :priority
  belongs_to :user
  validates :user_id, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
end
