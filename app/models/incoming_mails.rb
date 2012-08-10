class IncomingMails < ActiveRecord::Base

attr_accessible :to, :from, :ip, :body
end
