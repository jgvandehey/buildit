class Prioritization < ActiveRecord::Base
  attr_accessible :company_id, :created_at, :feature_id
  belongs_to :feature
  belongs_to :company
end
