class Post < ActiveRecord::Base

  has_many :comments 
  attr_accessible :position, :title, :tagline, :content, :visible
  

  def next_post
    Post.where('id > ?', self.id).first
  end


  def previous_post
    Post.where('id < ?', self.id).last
  end

  def post_position
    Post.count(:conditions => ['id <= ?', self.id])
  end



end
