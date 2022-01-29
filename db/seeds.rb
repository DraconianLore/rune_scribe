# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Starting Database Seed'

load 'db/seeds/admin.rb'
load 'db/seeds/tags.rb'
load 'db/seeds/runes.rb'
load 'db/seeds/structures2.rb'
load 'db/seeds/structures4.rb'
load 'db/seeds/structuresx.rb'

puts '------------------------------------'
puts 'Database Seeding Complete'