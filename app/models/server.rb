class Server < ActiveRecord::Base
  attr_accessible :name, :address
  belongs_to :user

 validates :name, presence: true, length: { maximum: 100 }
 validates :address, presence: true, length: { maximum: 16 }
  validates :user_id, presence: true

default_scope order: 'servers.created_at DESC'
end