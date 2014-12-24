class AddUrlToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :website_url, :string
  	add_column :companies, :twitter_nickname, :string
  end
end
