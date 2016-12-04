# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'apartment_import2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
a = Apartment.new
a.id = row['id']
 a.apartment_name = row['Apartment_name']
 a.address = row['Address']
 a.city = row['City']
 a.state = row['State']
 a.zip = row['Zip']
 a.bedrooms = row['Bedrooms']
 a.bathrooms = row['Bathrooms']
 a.save
 end

puts "There are now #{Apartment.count} rows in the apartments table"
