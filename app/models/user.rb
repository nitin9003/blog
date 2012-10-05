class User < ActiveRecord::Base
  
  has_many :comments

  attr_accessible :f_name, :l_name, :sex, :dob, :email, :password, :visible, :about_user


end
