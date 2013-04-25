namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_items
  end
end

def make_users
  user = User.create!(name:     "Liviu the awesome",
                       email:    "unknownliviu@gmail.com",
                       phone:    "10876234567",
                       location: "la Aurora",
                       password: "foobar",
                       password_confirmation: "foobar")
  #admin.toggle!(:admin)

  32.times do |n|
    name  = Faker::Name.name
    email = "slave-#{n+1}@chucknorris.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 phone:    "10876234567",
                 location: "la #{name}",               
                 password: password,
                 password_confirmation: password)
  end
end

def make_items
  users = User.all(limit: 6)
  5.times do
    name = Faker::Name.name
    description = Faker::Lorem.sentence(5)
    price = 42.42
    users.each { |user| user.items.create!(name: name, description: description, price: price) }
  end
end
