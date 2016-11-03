require 'random_data'

#create users
10.times do
  User.create!(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password
    )
end
users = User.all

#create private wikis
15.times do
  wiki_private = Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: true
  )
  wiki_private.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

#create public wikis
15.times do
  wiki_public = Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false
  )
  wiki_public.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

#create admin
admin = User.create!(
  name: "Master",
  email: "briansmont830@gmail.com",
  password: "password",
  role: "admin"
)

standard_member = User.create!(
  name: 'Mr. Standard Member',
  email: 'standard@bloc.com',
  password: 'password',
)

premium_member = User.create!(
  name: 'Mr. Premium Member',
  email: 'premium@bloc.com',
  password: 'password',
  role: 'premium_member'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{admin.email} admin created"
puts "#{premium_member.email} premium member created"
puts "#{standard_member.email} standard member created"
