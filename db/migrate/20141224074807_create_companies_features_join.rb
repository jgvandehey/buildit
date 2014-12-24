class CreateCompaniesFeaturesJoin < ActiveRecord::Migration
	def up
		create_table 'companies_features', :id => false do |t|
			t.column 'company_id', :integer
			t.column 'feature_id', :integer
		end
	end

	def down
		drop_table 'companies_features'
	end
end
