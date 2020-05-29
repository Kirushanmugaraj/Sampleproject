# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['Admin', 'EndUser'].each do |role_name|
  Role.find_or_create_by(name: role_name)
end
sa_role = Role.first
admin_user = User.new(username: "Admin", role_id: sa_role.id, email: "admin@example.com", password: "Password@123")
if admin_user.save
  p "Created Admin User - #{admin_user.username}"
else
  p "Cannot create builder user - #{admin_user.errors.full_messages.join(', ')}"
end