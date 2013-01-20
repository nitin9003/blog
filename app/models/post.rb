class Post < ActiveRecord::Base

  has_many :comments
  has_one :rating, :dependent => :destroy
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

  def self.paginate_post(search, page)
    Post.paginate :per_page => 3, :page => page,
             :conditions => ['name = ? AND visible = ?', "%#{search}%", true],
             :order => 'name'
  end

end
