class Admin < ActiveRecord::Base
  has_many :posts
  
  attr_accessor :password
  attr_accessible :email, :password
  

  validates_presence_of :email
  validates_length_of :password, :within => 8..25, :on => :create

  before_create :create_hashed_password
  after_save :clear_password
  
  attr_protected :hashed_password, :salt
  
  def self.authenticate(email="", password="")
    admin = Admin.find_by_email(email)
    if admin && admin.password_match?(password)
      return admin
    else
      return false
    end
  end


  def password_match?(password="")
    hashed_password == Admin.hash_with_salt(password, salt)
  end

  def make_salt(email = nil)
    Digest::SHA1.hexdigest("Use #{email} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  private

  def create_hashed_password
    unless password.blank?
      self.salt = make_salt(email) if self.salt.blank?
      self.hashed_password = hash_with_salt(password, self.salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
