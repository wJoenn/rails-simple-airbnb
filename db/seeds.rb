10.times do
  flat = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph(sentence_count: rand(3..7)),
    price_per_night: rand(50..100),
    number_of_guests: rand(1..4)
  }

  Flat.create!(flat)
end
