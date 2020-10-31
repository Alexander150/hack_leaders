# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.create(username: "teacher", password: "password", user_type: "teacher")
# user = User.create(username: "student", password: "password", user_type: "student")
task = Task.create(inputs: "1,2,3,4,5,6,7,8,9,10", outputs: "2,4,6,8,10,12,14,16,18,20")