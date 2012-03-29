namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
      admin.toggle!(:admin)
    

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@cloudadmin.us"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

   users = User.all(limit: 6)
    50.times do
      name = Faker::PhoneNumber.phone_number
      address = Faker::Internet.domain_name
      users.each { |user| user.servers.create!(name: name, address: address) }
    end
  end
end