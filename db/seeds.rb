# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#
require 'faker'
puts 'Adding Restaurants'
5.times do |restaurant_number|
  puts "Adding Restaurant No. #{restaurant_number + 1}"
  restaurant = Restaurant.new(name: Faker::Restaurant.name,
                              address: Faker::Address.street_address,
                              phone_number: Faker::PhoneNumber.phone_number_with_country_code,
                              category: %w[chinese italian japanese french belgian].sample)
  restaurant.save
  (1..10).to_a.sample.times do
    review = Review.new(content: Faker::Restaurant.review, rating: (0..5).to_a.sample, restaurant: restaurant)
    review.save
  end
end
puts 'Finished adding Restaurants and reviews'

# Faker::Restaurant.review
# ["chinese", "italian", "japanese", "french", "belgian"].sample.join("")
