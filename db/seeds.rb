# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Work.create([{title: 'Cool Title', creator: 'Suge', publication_year: 2017, description: 'A long desc', category: 'book'}])

Work.create([{title: 'Cool Title 2', creator: 'Finn', publication_year: 2019, description: 'A longer desc', category: 'movie'}])

Work.create([{title: 'Eating', creator: 'Girlie', publication_year: 2006, description: 'A food', category: 'album'}])

Work.create([{title: 'Hairballs', creator: 'Kitty', publication_year: 2006, description: 'Was a food', category: 'album'}])
