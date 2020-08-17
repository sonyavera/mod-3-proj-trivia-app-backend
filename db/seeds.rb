# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: "Jeff", last_name: "Adler", username: "jeff_is_da_best", email: "jeffdabest@dabomb.com")
Quiz.create(category: "science", difficulty:"hard")
QuizResult.create(user: User.all[0], quiz: Quiz.all[0])
