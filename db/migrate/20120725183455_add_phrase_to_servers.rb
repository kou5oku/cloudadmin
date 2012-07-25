class AddPhraseToServers < ActiveRecord::Migration
  def change
    add_column :servers, :phrase, :string

  end
end
