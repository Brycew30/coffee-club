class Coffee < ActiveRecord::Base

  belongs_to :user
  validates :name, :origin, :variety, :notes, :intensifier, :rating, presence: true

  def formatted_created_at
    self.created_at.strftime("%a %B %e %Y %l %M %p")
  end

end
