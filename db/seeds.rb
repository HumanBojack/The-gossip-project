# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.destroy_all
Gossip.all.destroy_all
Tag.all.destroy_all
GivenTag.all.destroy_all
City.all.destroy_all
Like.all.destroy_all
Comment.all.destroy_all

20.times do 
	City.create(name: Faker::Address.unique.city, zip_code: rand(10000..99999))
end

15.times do 
	first_name = Faker::Name.first_name
	User.create(first_name: first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::SouthPark.quote, email: Faker::Internet.unique.free_email(name: first_name), age: rand(18..99), city: City.all.sample, password: "password")
end

10.times do
	Tag.create(title: Faker::Book.unique.genre)
end

50.times do
	g = Gossip.create(title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 2) , content: Faker::TvShows::MichaelScott.quote , user: User.all.sample)

	rand(1..3).times do |k|
		GivenTag.create(gossip: g, tag: Tag.all.sample)
	end
end

200.times do
	Like.create(user: User.all.sample, gossip: Gossip.all.sample)
end

200.times do
	Comment.create(user: User.all.sample, gossip: Gossip.all.sample, content: Faker::GreekPhilosophers.quote)
end

#Create a message that gets send to two receivers
# sender = User.find(1)
# receiver1 = User.find(2)
# receiver2 = User.find(3)
# pm = PrivateMessage.create(user: sender, content:"Hey guys !")
# Receiver.create(user: receiver1, private_message: pm)
# Receiver.create(user: receiver2, private_message: pm)