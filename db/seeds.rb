# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Events extension
#Refinery::Events::Engine.load_seed
r1 = Role.find_or_create_by_title( 'Refinery' )
r2 = Role.create( :title => 'Superuser' )
u = User.create( :email => 'admin@goevents.com', :password => 'password')
u.roles << r1
u.roles << r2
