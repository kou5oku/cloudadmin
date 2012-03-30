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

   users = User.all(limit: 20)
    50.times do
      name = Faker::Internet.domain_name
      address = Array.new(4){rand(256)}.join('.')
      users.each { |user| user.servers.create!(name: name, address: address) }
    end
  end
end