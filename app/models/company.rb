class Company < ActiveRecord::Base
	attr_accessible :name, :website_url, :twitter_nickname, :avatar, :image_remote_url
	has_many :prioritizations
	has_many :features, :through => :prioritizations
	has_attached_file :avatar, :styles => { :small => "100x100#", :medium => "300x300#", :large => "500x500#" }, :default_url => "https://s3.amazonaws.com/featurehunt/FeatureHunt.png"  


	def image_remote_url=(url_value)
		self.avatar = URI.parse(url_value) unless url_value.blank?
		super
	end
end
