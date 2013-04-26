namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_single_user
    make_items
    make_admins
  end
  desc "Fill with basic data"
  task populate_basic: :environment do
    make_admins
    make_single_user
  end
end

def make_admins
  admin = Admin.create!(
    email: "admin@admin.com",
    password: "jacobs",
    password_confirmation: "jacobs")
end

def make_single_user
  user = User.create!(name:     "Liviu the awesome",
                       email:    "foouser@jacobs-university.de",
                       phone:    "10876234567",
                       location: "la Aurora",
                       password: "foobar",
                       password_confirmation: "foobar")
end

def make_users

  #admin.toggle!(:admin)

  32.times do |n|
    name  = Faker::Name.name
    email = "student-#{n+1}@jacobs-university.de"
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
  10.times do
    name = Faker::Lorem.sentence(1)
    description = Faker::Lorem.sentence(5)
    price = 42.42
    users.each { |user| user.items.create!(name: name, description: description, price: price) }
  end
end
