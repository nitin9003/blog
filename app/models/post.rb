class Post < ActiveRecord::Base

  has_many :comments 
  attr_accessible :position, :title, :tagline, :content, :visible

end
