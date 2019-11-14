user1 = User.create({username: 'johny', email: 'john.doe@test.com', password: 'password'})
user2 = User.create({username: 'annie', email: 'anne.other@test.com', password: 'password'})
user3 = User.create({username: 'sam', email: 'sam@test.com', password: 'password'})

posts = [
  {message: 'What do sprinters eat before a race? Nothing, they fast!', user_id: user1.id},
  {message: 'Why did the scarecrow win an award? Because he was outstanding in his field!', user_id: user3.id},
  {message: 'What do you call a macncheese that gets all up in your face? Too close for comfort food!', user_id: user2.id },
  {message: 'Why couldnt the bicycle stand up by itself? It was two tired!', user_id: user1.id},
  {message: 'Did you hear about the restaurant on the moon? Great food, no atmosphere!', user_id: user1.id},
  {message: 'What do you call a fish with two knees? A two-knee fish!', user_id: user3.id},
  {message: 'Why do melons have weddings? Because they cantaloupe!', user_id: user2.id}
]

posts.each do |post|
  new_post = Post.create(post)
end