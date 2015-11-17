# Post.destroy_all
# City.destroy_all
# User.destroy_all

# 10.times { |i| Post.create(title: "Post #{i}", content: BetterLorem.p(5, false, false), city: "San Francisco", user_id: 1, city_id: 1) }
# 10.times { |i| Post.create(title: "Post #{i + 10}", content: BetterLorem.p(5, false, false), city: "San Francisco", user_id: 2, city_id: 1) }
# 10.times { |i| Post.create(title: "Post #{i + 20}", content: BetterLorem.p(5, false, false), city: "London", user_id: 1, city_id: 2) }
# 10.times { |i| Post.create(title: "Post #{i + 30}", content: BetterLorem.p(5, false, false), city: "London", user_id: 2, city_id: 2) }
# 10.times { |i| Post.create(title: "Post #{i + 40}", content: BetterLorem.p(5, false, false), city: "Tokyo", user_id: 1, city_id: 3) }
# 10.times { |i| Post.create(title: "Post #{i + 50}", content: BetterLorem.p(5, false, false), city: "Tokyo", user_id: 2, city_id: 3) }

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

# User.create([
# 	{
# 		first_name: "Jane",
# 		last_name: "Smith",
# 		username: "jsmith10",
# 		current_city: "San Francisco",
# 		email: "jane.smith@gmail.com",
# 		password_digest: "12345678"
# 	},
# 	{
# 		first_name: "Mark",
# 		last_name: "Jones",
# 		username: "markjonesbabyyeah",
# 		current_city: "San Francisco",
# 		email: "mark.jones@gmail.com",
# 		password_digest: "98765432"
# 	},
# ])



