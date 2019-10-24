# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([
                                 { title: 'Movies' },
                                 { title: 'Books' }
                             ])
tests = Test.create([
                        { title: 'Batman Quiz', level: '1', category_id: categories[0].id },
                        { title: 'The Hobbit Quiz', level: '2', category_id: categories[1].id }
                    ])
questions = Question.new([
                             { text: 'Who makes Batman\'s suits?' },
                             { text: 'Who killed Smaug?' }
                         ])
answers = Answer.new([
                         { text: 'Alfred Pennyworth', correct: true },
                         { text: 'Harvey Dent', correct: false },
                         { text: 'Robin', correct: false },
                         { text: 'Bard the Bowman', correct: true },
                         { text: 'Gandalf', correct: false },
                         { text: 'Thorin', correct: false }
                     ])

users = User.create([
                        { name: 'user1', password: '111' }, { name: 'user2', password: '222' }
                    ])
user_test = UserTest.create([{ user_id: users[0].id, test_id: tests[0].id },
                             { user_id: users[0].id, test_id: tests[1].id },
                             { user_id: users[1].id, test_id: tests[0].id }])