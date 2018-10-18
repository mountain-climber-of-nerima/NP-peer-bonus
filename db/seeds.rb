# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"
#CSV.foreach('db/seed_01.csv', encoding: "Shift_JIS:UTF-8", undef: :replace, replace: "*")　do |row|
CSV.foreach('db/seed_01.csv', encoding:"Shift_JIS:UTF-8") do |row|
  next if row[0] == "name"
  User.create(name: row[0], email: row[1], password: row[2])
end
