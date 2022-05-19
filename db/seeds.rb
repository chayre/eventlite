# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
User.create!([
  {name: 'Admin', username: 'Admin', email: "admin@eventlite.com", password: "Admin1", password_confirmation: "Admin1", reset_password_token: nil, remember_created_at: nil, created_at: "2022-02-06 14:02:10", updated_at: nil, admin: true},
  {name: 'John Cena', username: 'john93', email: "john@gmail.com", password: "password", password_confirmation: "password", reset_password_token: nil, remember_created_at: nil, created_at: "2022-02-06 14:02:10", updated_at: nil, admin: false},
  {name: 'Ricky Bobby', username: 'rickybobby', email: "ricky@gmail.com", password: "password", password_confirmation: "password", reset_password_token: nil, remember_created_at: nil, created_at: "2022-02-06 14:02:10", updated_at: nil, admin: false},
  {name: 'Hal Ford', username: 'hal12', email: "hal@gmail.com", password: "password", password_confirmation: "password", reset_password_token: nil, remember_created_at: nil, created_at: "2022-02-06 14:02:10", updated_at: nil, admin: false},
  {name: 'Sarah Ee', username: 'sarahee', email: "sarah@gmail.com", password: "password", password_confirmation: "password", reset_password_token: nil, remember_created_at: nil, created_at: "2022-02-06 14:02:10", updated_at: nil, admin: false}
])