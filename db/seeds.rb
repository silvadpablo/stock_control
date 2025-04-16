# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
[
    {
        name: "admin",
        email: "admin@email.com"
    },
    {
        name: "user",
        email: "user@email.com"
    }
].each do |user_attributes|
    user = User.find_or_initialize_by(email: user_attributes[:email])
    user.assign_attributes(user_attributes)
    user.save!
    puts "Created user: #{user.name} with email: #{user.email}"
end

# Create stores
[
    {
        name: "Loja principal",
        location: "Cidade principal",
        user_id: 1
    },
    {
        name: "Loja secundária",
        location: "Cidade secundária",
        user_id: 1
    }
].each do |store_attributes|
    store = Store.find_or_initialize_by(name: store_attributes[:name])
    store.assign_attributes(store_attributes)
    store.save!
    puts "Created store: #{store.name} in location: #{store.location}"
end