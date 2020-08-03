15.times do
  Coffee.create([{
    :name => Faker::Coffee.unique.blend_name,
    :origin => Faker::Coffee.unique.origin,
    :variety => Faker::Coffee.unique.variety,
    :notes => Faker::Coffee.unique.notes,
    :intensifier => Faker::Coffee.unique.intensifier
    }])
  end
