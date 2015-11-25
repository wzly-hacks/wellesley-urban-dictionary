require 'faker'

#create users

5.times do
	user = User.new(
		name: Faker::Name.name,
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
	name: 'Polina',
	email: 'psoshnin@gmail.com',
	password: 'popcorns')

# Create an admin user
admin = User.new(
	name: "Admin",
	email: "Admin@hello.com",
	password: "helloadmin",
	role: 'admin'
	)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
	name: "Moderator",
	email: "Mod@hello.com",
	password: "hellomoder",
	role: 'moderator'
	)
moderator.skip_confirmation!
moderator.save!

#create a member
member = User.new(
	name: "Member",
	email: "Member@hello.com",
	password: "hellomember"
	)
member.skip_confirmation!
member.save!

#create topics
15.times do
	Topic.create!(
		name: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph)
end
topics = Topic.all

#Create entries
50.times do 
	Entry.create!(
		user: users.sample,
		topic: topics.sample,
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
puts "#{Topic.count} topics created."
puts "#{Entry.count} entries created."
puts "#{Comment.count} comments created."

