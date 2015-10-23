require 'faker'

#create users

5.times do
	user = User.new(
		email: Faker::Internet.email,
		password: Faker::Lorem.characters(10)
		)
	user.skip_confirmation!
	user.save!
end

users = User.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
	email: 'psoshnin@gmail.com',
	password: 'popocorn')

#Create entries
50.times do 
	Entry.create!(
		user: users.sample,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
end

entries = Entry.all 

#Create comments
100.times do
	Comment.create!(
		entry: entries.sample,
		body: Faker::Lorem.paragraph
	) 
end

puts "Seed finished!"
puts "#{User.count} users created."
puts "#{Entry.count} entries created."
puts "#{Comment.count} comments created."

