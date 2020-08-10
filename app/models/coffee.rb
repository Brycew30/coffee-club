class Coffee < ActiveRecord::Base

  belongs_to :user
  validates :name, :origin, :variety, :notes, :intensifier, presence: true

end
