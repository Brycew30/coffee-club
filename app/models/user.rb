class User < ActiveRecord::Base

  has_many :coffees
  has_secure_password

end
