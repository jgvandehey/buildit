class AddImageRemoteUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :image_remote_url, :string
  end
end
