namespace :db do
	desc "Fill Database with fiigii"
	task :populate => :environment do
		make_users
		post_some
		follow
		good_and_down
	end

	desc "Fill new Posts"
	task :add_new => :environment do
		1.upto(20) do |n|
			File.open("lib/tasks/#{n}.txt", "r") do |file|
				content = file.read
				user = User.find(n)
				user.statuses.create(content: content)
			end
		end
	end
end

def make_users
	99.times do |n|
		name = Faker::Name.name
		email = "email_#{n + 1}@gmail.com"
		password = "123456"
		descript = "I am a Faker for CA! I like Ruby, Objective-C, Scheme and Haskell."
		gender = "m"
		url = "#{name.split.join("_")}.fiigii.com"
		User.create(name: name,
			email: email,
			descript: descript,
			gender: gender,
			url: url,
			password: password,
			password_confirmation: password,)
	end
end

def post_some
	prng = Random.new(12345)
	users = User.all
	users.each do |user|
		prng.rand(0..32).times do |n|
			content = Faker::Lorem.sentence(300)
			user.statuses.create(content: content)
		end
	end
end

def follow
	users = User.all
	user = users.first
	followed_users = users[2..80]
	followers = users[3..77]
	followed_users.each { |u| user.follow! u }
	followers.each { |u| u.follow! user }
end

def good_and_down
	users = User.all(limit: 50)
	statuses = (Status.all(limit: 200).shuffle)[0..100]
	users.each do |user|
		statuses.each do |status|
			status.good! user
			status.bad! user
		end
	end
end