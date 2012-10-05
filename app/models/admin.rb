class Admin < ActiveRecord::Base
  has_many :posts
  attr_accessible :email, :password
end
