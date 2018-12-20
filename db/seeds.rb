

# Interests -> 10 categories

# Users + Contacts (5 Users with contacts - Not Including Demo User)
#
# 9 Greater Lisbon
# 9 New York City

# Restaurants -> Seed 10 for each city using API Connector

# Availability Dates | Meal Setup
#
# 16th December -> User + 7
# 18th December -> User + 7
# 21st December -> User + 3 --> Cancelled
# 26th December -> User + 7 --> Reject
# 27th December -> User + 6 --> Event Unconfirmed
# 28th December -> User + 4 --> Event Confirmed
# 30th Decembe -> 4 (before mealscheduler) + 1 after the meal scheduler activated --> set interests (disable all but one) +Set Availability + event scheduling during the demo

# Cleanup
puts "---------------- Destroying Rows ---------------------"


puts "Restaurants -> Before: #{Restaurant.all.count}"
puts "\tMeals -> Before: #{Meal.all.count}"
puts "\t\tAttendees -> Before #{Attendee.all.count}"

Restaurant.destroy_all

puts "Interests -> After: #{Interest.all.count}"
puts "\tUserInterests -> After: #{UserInterest.all.count}"
puts "\t\tAttendees -> After #{Attendee.all.count}"
puts "\t\t\t\t\t\t\t----"

puts "Interests -> Before: #{Interest.all.count}"
puts "\tUserInterests -> Before: #{UserInterest.all.count}"

Interest.destroy_all

puts "Interests -> After: #{Interest.all.count}"
puts "\tUserInterests -> After: #{UserInterest.all.count}"
puts "\t\t\t\t\t\t\t----"

puts "Userd -> Before: #{User.all.count}"
puts "\tAvailabilities -> Before: #{Availability.all.count}"
puts "\t\tContacts -> Before #{Contact.all.count}"

User.destroy_all

puts "User -> After: #{User.all.count}"
puts "\tAvailabilities -> After: #{Availability.all.count}"
puts "\t\tContacts -> After #{Contact.all.count}"
puts "\t\t\t\t\t\t\t----"

puts "----------------Seeding Interests---------------------"

Interest.create!([{ name: "Movies" }, { name: "Fitness" },
  { name: "Humor" }, { name: "Video Games" }, { name: "Books" }, { name: "Politics" },
  { name: "Sports" }, { name: "Travel" }, { name: "Games" }, { name: "Hiking" }])
puts "Created #{Interest.all.count} Interests"
puts "----------------Seeding Restaurants--------------------"

# Call Restaurant Api Reader Service

lisbon_restaurants = [{
  zomato_restaurant_id: 18545575,
  name: "Golden Sushi",
  address: "Hotel Portugal, Rua João das Regras, 4C, Mouraria, Lisboa",
  rating: 4.0,
  avg_price: 50,
  currency: "€",
  location: "Greater Lisbon",
  longitude: -9.1368068755,
  latitude: 38.7148174085,
  website: "https://www.zomato.com/grande-lisboa/golden-sushi-hotel-portugal-mouraria-lisboa?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"
}, {
  zomato_restaurant_id: 18451895,
  name: "Premium Winehouse",
  address: "Hotel Portugal, Rua João das Regras, 4, Mouraria, Lisboa 1100-294 L",
  rating: 0,
  avg_price: 25,
  currency: "€",
  location: "Greater Lisbon",
  longitude: -9.1368068755,
  latitude: 38.7148174085,
  website: "https://www.zomato.com/grande-lisboa/premium-winehouse-hotel-portugal-mouraria-lisboa?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"
}]
lisbon_restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

new_york_restaurants = [{
  zomato_restaurant_id: 16771079,
  name: "Lombardi's Pizza",
  address: "32 Spring Street, New York 10012",
  rating: 4.9,
  avg_price: 50,
  currency: "€",
  location: "New York City",
  longitude: -73.9955888889,
  latitude: 40.7216750000,
  website: "https://www.zomato.com/new-york-city/lombardis-pizza-lower-east-side?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"
}, {
  zomato_restaurant_id: 16769546,
  name: "Katz's Delicatessen",
  address: "205 East Houston Street, New York 10002",
  rating: 4.9,
  avg_price: 30,
  currency: "$",
  location: "New York City",
  longitude: -9.1368068755,
  latitude: 38.7148174085,
  website: "https://www.zomato.com/new-york-city/katzs-delicatessen-lower-east-side?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1"

}]
new_york_restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end
puts "Created #{Restaurant.all.count} Restaurants"

puts "------------------- Seeding Users ---------------------"

# New York Users
location = "New York City"
new_user = {
  first_name: "Jami",
  email: "jamirene88@gmail.com",
  password: "123456",
  age: 26,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545136188/zgbijybxmndiwsffnpja.jpg",
  gender: "Female",
  location: location
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-21'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-27'
},{
  user: user,
  date: '2018-12-28'
}])

##

Contact.create!([{
  contact: "910012309",
  user: user
}])

new_user = {
  first_name: "Chad",
  email: "chad@flavour.com",
  password: "123456",
  age: 26,
  photo: "https://res.cloudinary.com/dmmvkoibj/image/upload/v1545245418/qeifixmmjypwzx41hp1a.jpg",
  gender: "Male",
  location: location
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-21'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-27'
},{
  user: user,
  date: '2018-12-28'
}])

Contact.create!([{
  contact: "455019112",
  user: user
},{
  contact: "455089322",
  user: user,
  share: false
}])

##

new_user = {
  first_name: "Filipe",
  email: "filipe@flavour.com",
  password: "123456",
  age: 26,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545136195/fiiozsbboqgq99gxmoci.jpg",
  gender: "Male",
  location: location
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-27'
},{
  user: user,
  date: '2018-12-29'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

##

new_user = {
  first_name: "Sharron",
  email: "shar@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545136191/m13piifomeorm9ntttnb.jpg",
  gender: "Female",
  location: location
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-26'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])


##

new_user = {
  first_name: "Roberto",
  email: "rob@flavour.com",
  password: "123456",
  age: 26,
  photo: "https://res.cloudinary.com/dmmvkoibj/image/upload/v1544797120/mh9nytfkvpojp9i20anc.jpg",
  gender: "Male",
  location: location
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-28'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

##

new_user = {
  first_name: "Lenna",
  email: "lenna@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545136197/ynqmdwbwqow6tdrejf8m.jpg",
  gender: "Female",
  location: location
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-27'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

##

new_user = {
  first_name: "Larry",
  email: "larry@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://res.cloudinary.com/dmmvkoibj/image/upload/v1544797117/onahb4yyyy6kgzdakibd.jpg",
  gender: "Male",
  location: location
}

user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-29'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

##

new_user = {
  first_name: "Amber",
  email: "am@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545231558/African-American-Woman-Middle-Aged-WebSized-427845619-1.jpg",
  gender: "Female",
  location: location
}

user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-21'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-27'
},{
  user: user,
  date: '2018-12-28'
},{
  user: user,
  date: '2018-12-29'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

##

new_user = {
  first_name: "Jake",
  email: "jake@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545231770/African-American_man_wearing_fedora.jpg",
  gender: "Male",
  location: location
}

user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-27'
},{
  user: user,
  date: '2018-12-29'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

##

new_user = {
  first_name: "Dylan",
  email: "dylan@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1545231766/1.jpg",
  gender: "Male",
  location: location
}

user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create([{
  user: user,
  date: '2018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-21'
},{
  user: user,
  date: '2018-12-26'
}])

Contact.create!([{
  contact: "4450119019",
  user: user
}])

# Lisbon Users

location = "Greater Lisbon"
new_user = {
  first_name: "Pedro",
  email: "17pedro.n@gmail.com",
  password: "123456",
  age: 27,
  photo: "https://res.cloudinary.com/pnogueira/image/upload/ar_1:1,c_fill,g_auto,e_art:hokusai/v1544716538/sxr96ouzry0cvcmd2chf.jpg",
  gender: "Male",
  location: location,
  admin: true
}
user = User.new(new_user)
user.remote_photo_url = new_user[:photo]  if new_user.key?(:photo)
user.save!

Availability.create!([{
  user: user,
  date: '2''018-12-16'
},{
  user: user,
  date: '2018-12-18'
},{
  user: user,
  date: '2018-12-21'
},{
  user: user,
  date: '2018-12-26'
},{
  user: user,
  date: '2018-12-27'
},{
  user: user,
  date: '2018-12-28'
},{
  user: user,
  date: '2018-12-29'
}])

Contact.create!([{
  contact: "910012309",
  user: user
},{
  contact: "960012309",
  user: user,
  share: false
}])


puts "Created #{User.all.count} Users"
puts "Created #{UserInterest.all.count} User_Interests"



  JAMI = User.find_by(first_name: "Jami")
  TOM = User.find_by(first_name: "Chad")
def past_meals(date, lim)
    meal = Meal.create!({
    reservation_date: date,
    restaurant: Restaurant.where(location: "New York City").sample,
    interest: Interest.all.sample
  })

  Attendee.create!(user: JAMI, status:"Confirmed", meal: meal)
  Attendee.create!(user: TOM, status:"Confirmed", meal: meal)

  User.where(location: meal.restaurant.location).where.not(first_name: JAMI.first_name).where.not(first_name: TOM.first_name).limit(lim).each do |attendee|
    Attendee.create!(user: attendee, status:"Confirmed", meal: meal)
  end
  meal.update(capacity: meal.capacity - meal.attendees.count)
end

def future_meals(date, participants, status = "Confirmed")
    meal = Meal.create!({
    reservation_date: date,
    restaurant: Restaurant.where(location: "New York City").sample,
    interest: Interest.all.sample
  })

  participants.each do |attendee|
    Attendee.create!(user: attendee, status: status, meal: meal)
  end
  meal.update(capacity: meal.capacity - meal.attendees.count)
end

puts "------------------- Seeding Meals ---------------------"
puts "PAST"
past_meals('2018-12-16', 3)
past_meals('2018-12-18', 6)
puts "Future"

future_meals('2018-12-20', [TOM, User.find_by(first_name: "Sharron"),User.find_by(first_name: "Lenna"), User.find_by(first_name: "Filipe"),User.find_by(first_name: "Amber"), User.find_by(first_name: "Dylan")],"Invited")
future_meals('2018-12-20', [User.find_by(first_name: "Sharron"),User.find_by(first_name: "Lenna"), User.find_by(first_name: "Filipe"),User.find_by(first_name: "Amber"), User.find_by(first_name: "Dylan")],"Invited")
attendees_21 = [TOM, JAMI, User.find_by(first_name: "Amber"), User.find_by(first_name: "Dylan")]
attendees_26 = [TOM, JAMI, User.find_by(first_name: "Larry"), User.find_by(first_name: "Amber"), User.find_by(first_name: "Jake"), User.find_by(first_name: "Dylan")]
attendees_27 = [TOM, JAMI, User.find_by(first_name: "Filipe"), User.find_by(first_name: "Lenna"), User.find_by(first_name: "Amber"), User.find_by(first_name: "Jake")]
attendees_28 = [TOM, JAMI, User.find_by(first_name: "Roberto"), User.find_by(first_name: "Amber")]
attendees_30 = [User.find_by(first_name: "Amber"), User.find_by(first_name: "Sharron"), User.find_by(first_name: "Larry")]

#

future_meals('2018-12-26', attendees_26, "Invited") # TO BE REJECTED
future_meals('2018-12-27', attendees_27, "Invited")
future_meals('2018-12-28', attendees_28, "Confirmed")

future_meals('2018-12-29', attendees_30, "Invited") # 4 people, change interests so that only 1 or 2 match
