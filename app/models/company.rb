class Company < ActiveRecord::Base
  attr_accessible :name, :website_url, :twitter_nickname
  has_many :prioritizations
  has_many :features, :through => :prioritizations
end
