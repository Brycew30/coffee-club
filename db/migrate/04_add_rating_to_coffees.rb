class AddRatingToCoffees < ActiveRecord::Migration[5.2]

  def change
    add_column :coffees, :rating, :integer
  end

end
