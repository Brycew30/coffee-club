class User < ActiveRecord::Base

  has_secure_password
  has_many :coffees
  validates_presence_of :name, :username, :password

end
