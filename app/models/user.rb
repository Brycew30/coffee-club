class User < ActiveRecord::Base

  has_secure_password

  has_many :coffees

  validates :name, :username, presence: true
  validates :username, uniqueness: true

end
