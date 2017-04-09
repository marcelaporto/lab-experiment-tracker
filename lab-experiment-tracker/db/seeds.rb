# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Proposal.destroy_all
Experiment.destroy_all
Procedure.destroy_all
Observation.destroy_all
Comment.destroy_all

User.create(first_name: 'Dr', last_name: 'Awesome', email: 'drawesome@awesome.com', isScientist: true, password: 'password')

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, isScientist: true, password: 'password')
end

3.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, isScientist: false, password: 'password')
end

5.times do
  Proposal.create(summary:Faker::Lorem.sentence(3), hypothesis:Faker::Lorem.sentence(3)  , user_id: rand(1..6))
end

7.times do
  Experiment.create(title:Faker::Lorem.sentence(3), scientist_id: rand(1..6) , proposal_id: rand(1..4))
end

8.times do
  Procedure.create(body: Faker::Lorem.sentence(3), experiment_id: rand(1..6))
end

type_arr = ['Experiment', 'Procedure']

9.times do
  Observation.create(body:Faker::Lorem.sentence(3), scientist_id: rand(1..6), observational_id: rand(1..6), observational_type: type_arr.sample )
end

another_type_arr = ['Observation', 'Experiment', 'Proposal']

15.times do
  Comment.create(body: "THIS IS COMMENT", user_id: rand(1..9), commentable_id: rand(1..5), commentable_type: another_type_arr.sample )
end
