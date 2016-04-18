# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  User.create!(user_name: FFaker::Internet.user_name + rand.to_s, email: FFaker::Internet.email + rand.to_s, password: "pass", password_confirmation: "pass")
end

1000.times do
  number = rand(User.count)

  Link.create!(url: FFaker::Internet.http_url, title: FFaker::Food.meat, description: FFaker::Food.ingredient, user: User.offset(number).first)
end
