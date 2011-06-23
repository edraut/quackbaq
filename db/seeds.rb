# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
home = Category.create(:name => 'Home',:position => 1)
givebaq = Category.create(:name => 'GiveBaq',:position => 2)
fashion = Category.create(:name => 'Fashion',:position => 3)
travel = Category.create(:name => 'Travel',:position => 4)
electronics = Category.create(:name => 'Electronics',:position => 5)
events = Category.create(:name => 'Events',:position => 6)
games = Category.create(:name => 'Games',:position => 7)
lifestyle = Category.create(:name => 'Lifestyle',:position => 8)
gift_cards = Category.create(:name => 'Gift Cards',:position => 9)