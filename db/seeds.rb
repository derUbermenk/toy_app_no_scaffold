# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# clear unique generator for every run
Faker::UniqueGenerator.clear

# create users
15.times do
  name = Faker::GreekPhilosophers.unique.name
  User.create(
    name: name,
    email: "#{name}@email.com"
  )
end

def say_something_smart
  Faker::Hacker.say_something_smart
end

def abbreviation
  Faker::Hacker.abbreviation
end

def adjective
  Faker::Hacker.adjective
end

quote_generator = [
  -> {"#{say_something_smart} and #{say_something_smart}"},
  -> {"#{say_something_smart} to #{say_something_smart}!"},
  -> {"#{say_something_smart} then #{say_something_smart}. #{say_something_smart}"},
  -> {"#{abbreviation} ...#{adjective} #{say_something_smart}"}
]

User.all.each do |user| 
  user.microposts.create(
    content: quote_generator.sample.call
  )
end