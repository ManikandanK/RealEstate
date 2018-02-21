# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
#Admin Creation
admin = User.create(:full_name=>"Admin",:email=>"admin@realestate.com",:password=>"beh4ppy##")
admin.add_role :admin


#Agent Creation
agent = User.create(:full_name=>"Agent",:email=>"agent@realestate.com",:password=>"beagent##")
agent.add_role :agent


#Customer Creation
(1..10).each do |index|
  customer = User.create(:full_name=>"Customer#{index}",:email=>"customer#{index}@realestate.com",:password=>"becustomer#{index}##")
  customer.add_role :customer
end


#Property Creation
customer1 = User.create(:full_name=>"Customer113}",:email=>"customer114@realestate.com",:password=>"becustomer###")
customer1.add_role :customer

property_type = ["Rent","Sell"]
(1..5).each do |index|
  property = Property.create(:name => "Property#{index}",:user_id => customer1.id,:address => "Address#{index}",
                             :property_type => property_type[index%2],:map_position => "(13.018755789282308, 76.8975068628788)",
                             :state => "KA",:country => "IN" )
end