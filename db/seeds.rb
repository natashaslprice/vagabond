Post.destroy_all
City.destroy_all
User.destroy_all

Post.create([
	{
		title: "Burritt Room + Tavern",
		content: "Good bar with tasty cocktails. Bar snack selection limited, but waiters are attentive and will make any cocktail you want. I was there on a Friday night and the live jazz was brilliant.",
		city: "San Francisco",
		user_id: 1,
		city_id: 1
	},
	{
		title: "Sushirrito",
		content: "Sushi, the size of a burrito! What can go wrong!! Delicious lunch venue. Sumo Crunch is the best.",
		city: "San Francisco",
		user_id: 1,
		city_id: 1
	},
	{
		title: "Blowfish Sushi",
		content: "Really good sushi restaurant. Probably over-priced, but the menu is varied and the atmosphere is nice. Good date venue. The avocado/ salmon/ tuna pyramid is to die for!",
		city: "San Francisco",
		user_id: 1,
		city_id: 1
	},
	{
		title: "Crissy Fields",
		content: "Small beach near the Marina in SF. Nice for a morning walk, and always full of happy people walking their dogs or playing with their kids.",
		city: "San Francisco",
		user_id: 1,
		city_id: 1
	},
	{
		title: "Osaka Sushi",
		content: "Sushi was fine, but service pretty poor.",
		city: "San Francisco",
		user_id: 2,
		city_id: 1
	},
	{
		title: "Murphy's",
		content: "Fine. Nothing special. Pretty mellow.",
		city: "San Francisco",
		user_id: 2,
		city_id: 1
	},
	{
		title: "Lush Lounge",
		content: "Noisy and crowded. Very fun! Awesome for picking up chicks!",
		city: "San Francisco",
		user_id: 2,
		city_id: 1
	},
	{
		title: "El Rio",
		content: "The Mango event on the last Sunday of each month is fun.",
		city: "San Francisco",
		user_id: 2,
		city_id: 1
	},
	{
		title: "Osteria Basilico",
		content: "The most amazing little Italian with a non-descript front. Have the burrata to start and the seafood and pancetta pasta for mains.",
		city: "London",
		user_id: 2,
		city_id: 2
	},{
		title: "The Robot Show",
		content: "This will probably be the best night of your life. Go, drink Smirnoff Ice, wave those glow sticks and dance with robots under laser lights while they play Lady Gaga.",
		city: "Tokyo",
		user_id: 2,
		city_id: 3
	},
])

City.create([
	{
		name: "San Francisco",
		pic: "http://static1.squarespace.com/static/547f29bfe4b0dc192ed7bdac/54aeb15ce4b018c14f34c7cb/54aeb160e4b018c14f34c7ed/1420734817363/san-franc.jpg?format=2500w"
	},
	{
		name: "London",
		pic: "http://www.iapss.org/wp-content/uploads/2014/10/London1a.jpg"
	},
	{
		name: "Tokyo",
		pic: "http://www.accountant-tokyo.com/wp-content/uploads/2014/07/Shinjuku-Tokyo-Ville-N%C3%A9ons-Enseignes-3722.jpg"
	},
])

User.create([
	{
		first_name: "Jane",
		last_name: "Smith",
		username: "jsmith10",
		current_city: "San Francisco",
		email: "jane.smith@gmail.com",
		password_digest: "12345678"
	},
	{
		first_name: "Mark",
		last_name: "Jones",
		username: "markjonesbabyyeah",
		current_city: "San Francisco",
		email: "mark.jones@gmail.com",
		password_digest: "98765432"
	},
])



