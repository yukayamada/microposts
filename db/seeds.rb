# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Genre.create(name: "Jazz")
Genre.create(name: "Jazz Hiphop")
Genre.create(name: "Hiphop Jazz")
Genre.create(name: "Jazz Funk")
Genre.create(name: "Hiphop")
User.create(name: "yuka", email: "test@test.com", password: "test")