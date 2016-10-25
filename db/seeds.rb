require 'random_data'

#create users
5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
    )
end
users = User.all

#create wikis
25.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
  wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  
  
end

#create admin
admin = User.create!(
  email: "briansmont830@gmail.com",
  password: "password",
  role: "admin"
)

standard_member = User.create!(
  email: 'standard@bloc.com',
  password: 'password',
)

premium_member = User.create!(
  email: 'premium@bloc.com',
  password: 'password',
  role: 'premium_member'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{admin.email} admin created"
