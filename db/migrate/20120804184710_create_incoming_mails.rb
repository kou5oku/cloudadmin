class CreateIncomingMails < ActiveRecord::Migration
  def change
    create_table :incoming_mails do |t|
      t.string :from
      t.string :to
      t.string :ip
      t.string :body

      t.timestamps
    end
  end
end
