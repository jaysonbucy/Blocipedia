require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(6, 8)
  )
end

users = User.all

10.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::StarWars.quote,
    body: Faker::Lorem.paragraphs
  )
end

admin = User.create!(
  email:    'jayson@example.com',
  password: 'password',
  role:     'admin'
)

puts "Seed finshed"
puts "#{User.count} users created"
puts "#{Wiki.count} topics created"
