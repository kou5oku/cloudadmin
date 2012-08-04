class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :from
      t.string :to
      t.string :ip
      t.string :body

      t.timestamps
    end
  end
end
