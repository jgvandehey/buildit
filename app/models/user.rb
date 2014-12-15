class User < ActiveRecord::Base
	attr_accessible :name, :provider, :uid, :avatar
	has_many :features, :dependent => :destroy
	has_reputation :votes, source: {reputation: :votes, of: :features}, aggregated_by: :sum
	has_many :evaluations, class_name: "RSEvaluation", as: :source
	has_attached_file :avatar, :styles => { :header => "800x400#", :medium => "300x300#", :thumb => "100x100#" }, :default_url => "https://s3.amazonaws.com/unmute/icon_400.png"  


	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.avatar = auth['info']['image']
			user.nickname = auth['info']['nickname']
		end
	end

	def voted_for?(feature)
		# evaluations.exists?(target_type: feature.class, target_id: feature.id).present?
		evaluations.exists?(target_type: feature.class, target_id: feature.id)
	end
end
