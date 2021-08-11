# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Fish.create([
    {species: "Shark", color: "grey", weight: 99.0 },
    {species: "Flounder", color: "brown", weight: 8.0},
    {species: "Seabass", color: "black", weight: 5.0}
])