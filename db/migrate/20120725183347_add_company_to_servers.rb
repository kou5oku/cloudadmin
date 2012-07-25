class AddCompanyToServers < ActiveRecord::Migration
  def change
    add_column :servers, :company, :string

  end
end
