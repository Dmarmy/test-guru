# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([
                                  { title: 'Movies' },
                                  { title: 'Books' }
                              ])

users = User.create!([
                         { name: 'user1', password: '111' }, { name: 'user2', password: '222' }
                     ])

tests = Test.create!([
                         { title: 'Batman Quiz', level: '1', category: categories[0], author: users[0] },
                         { title: 'The Hobbit Quiz', level: '2', category: categories[1], author: users[0] }
                     ])

questions = Question.create!([
                                 { text: 'Who makes Batman\'s suits?', test: tests[0] },
                                 { text: 'Who killed Smaug?', test: tests[1] },
                                 { text: 'Who doesnt makes Batman\'s suits?', test: tests[0] },
                                 { text: 'Who doesnt killed Smaug?', test: tests[1] }
                              ])
answers = Answer.create!([
                             { text: 'Alfred Pennyworth', correct: true, question: questions[0] },
                             { text: 'Harvey Dent', correct: false, question: questions[0] },
                             { text: 'Robin', correct: false, question: questions[0] },
                             { text: 'Bard the Bowman', correct: true, question: questions[1] },
                             { text: 'Gandalf', correct: false, question: questions[1] },
                             { text: 'Thorin', correct: false, question: questions[1] },
                             { text: 'Alfred Pennyworth', correct: false, question: questions[2] },
                             { text: 'Harvey Dent', correct: true, question: questions[2] },
                             { text: 'Robin', correct: true, question: questions[2] },
                             { text: 'Bard the Bowman', correct: false, question: questions[3] },
                             { text: 'Gandalf', correct: true, question: questions[3] },
                             { text: 'Thorin', correct: true, question: questions[3] }
                         ])
TestPassage.create!([
                        { user: users[0], test: tests[0] },
                   { user: users[0], test: tests[1] },
                   { user: users[1], test: tests[0] }
                    ])
