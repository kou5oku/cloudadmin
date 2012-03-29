class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :address
      t.integer :user_id

      t.timestamps
    end
    add_index :servers, [:user_id, :created_at]
  end
end
