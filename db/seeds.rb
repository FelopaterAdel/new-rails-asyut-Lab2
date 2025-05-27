# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear existing data (optional, use with caution in production)
PostEditor.destroy_all
Post.destroy_all
User.destroy_all

users = [
  { name: "Alice" },
  { name: "Bob" },
  { name: "Charlie" }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

alice, bob, charlie = created_users

posts = [
  { title: "Rails Associations Guide",  creator: alice },
  { title: "Ruby Tips", creator: bob },
  { title: "JavaScript Basics",  creator: alice }
]

created_posts = posts.map do |post_data|
  Post.create!(post_data)
end

guide_post, ruby_post, js_post = created_posts

PostEditor.create!([
  { user: bob, post: guide_post },      
  { user: charlie, post: guide_post }, 
  { user: alice, post: ruby_post }     
])

puts "Seeded #{User.count} users, #{Post.count} posts, and #{PostEditor.count} editor assignments."