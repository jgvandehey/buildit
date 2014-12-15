class User < ActiveRecord::Base
	attr_accessible :name, :provider, :uid
	has_many :features, :dependent => :destroy
	has_reputation :votes, source: {reputation: :votes, of: :features}, aggregated_by: :sum
	has_many :evaluations, class_name: "RSEvaluation", as: :source


	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
	end

	def voted_for?(feature)
		# evaluations.exists?(target_type: feature.class, target_id: feature.id).present?
		evaluations.exists?(target_type: feature.class, target_id: feature.id)
	end
end
