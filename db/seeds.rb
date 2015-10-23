require 'faker'

#Create entries
50.times do 
	Entry.create!(
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
puts "#{Entry.count} entries created."
puts "#{Comment.count} comments created."

