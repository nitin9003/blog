class Comment < ActiveRecord::Base

  belongs_to :post
  attr_accessible :position, :title, :content, :name, :email, :visible
end
