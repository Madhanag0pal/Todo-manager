# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(first_name: "Madhan", last_name: "N", email: "madhan@email.com", password: "pass")
u2 = User.create!(first_name: "test", email: "test@email.com", password: "test")

Todo.create!(todo_text: "File taxes", due_date: Date.today, completed: false, user_id: u1.id)
Todo.create!(todo_text: "Submit assignment", due_date: Date.today + 1, completed: false, user_id: u1.id)

Todo.create!(todo_text: "File taxes", due_date: Date.today, completed: false, user_id: u2.id)
Todo.create!(todo_text: "Submit assignment", due_date: Date.today + 1, completed: false, user_id: u2.id)
