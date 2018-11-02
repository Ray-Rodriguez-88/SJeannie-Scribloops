# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Document.destroy_all
# PortfolioDocument.destroy_all
# Portfolio.destroy_all
UserPortfolio.destroy_all
User.destroy_all


User.create(first_name: 'Pablo', last_name: 'Argueta', email: Faker::Internet.free_email('pablo'), username: "pablo", password: 'grandmaShark', user_type: 'Admin', education_level: 'N/A')

User.create(first_name: 'Jeannie', last_name: 'Kim', email: Faker::Internet.free_email('jeannie'), username: "jeannie", password: 'grandmaShark', user_type: 'Admin', education_level: 'N/A')

User.create(first_name: 'Ray', last_name: 'Rodriguez', email: Faker::Internet.free_email('ray'), username: "ray", password: 'grandmaShark', user_type: 'Admin', education_level: 'N/A')

User.create(first_name: 'Joshua', last_name: 'Miles', email: Faker::Internet.free_email('josh'), username: "josh", password: 'grandmaShark', user_type: 'Admin', education_level: 'N/A')

User.create(first_name: 'Annakate', last_name: 'Detro', email: Faker::Internet.free_email('annakate.d'), username: "annakate", password: 'babyshark', user_type: 'Student', education_level: 'N/A')

User.create(first_name: 'Benjamin', last_name: 'Underwood', email: Faker::Internet.free_email('benjamin.u'), username: "benjamin", password: 'babyshark', user_type: 'Student', education_level: 'N/A')

User.create(first_name: 'Yang', last_name: 'Xu', email: Faker::Internet.free_email('Yang.X'), username: "yang", password: 'grandmaShark', user_type: 'Student', education_level: 'N/A')


num = 20

education_levels = ['K', '1st', '2nd', '3rd', '4th', '5th','6th', '7th', '8th', '9th', '10th', '11th', '12th', 'Post-high school']

user_types = ['Student','Guardian/Parent', 'Educator']

while num > 0 do

  user_type = user_types.sample
  education_level = 'N/A'

  if user_type === 'Student'
    education_level = education_levels.sample
  end

  firstName = Faker::Ancient.hero
  lastName = Faker::Ancient.primordial

  fullName = (firstName+lastName).downcase

# byebug
  User.create(first_name: firstName, last_name: lastName, email: Faker::Internet.free_email(fullName), username: "#{fullName}", password: 'grandmaShark', user_type: user_type, education_level: education_level)

  num -= 1
end