# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def lorem(count_lower, count_upper, type = 'words')
  if count_lower == 0 then
    if rand(count_lower-count_upper) == 0 then
      return ''
    else 
      count_lower = 1
    end
  end  
  
  Lorem::Base.new(type, rand(count_upper-count_lower)+count_lower).output
end

5.times do 
  sample_topic = Topic.create [
    heading: lorem(4, 10),
    description: lorem(10, 30)
  ]

  x = rand(10) + 2
  x.times do 
    sample_user = User.create [
       name: lorem(2, 3),
       city: lorem(1, 2),
       country: lorem(1, 2)
    ]

    sample_post = Post.create [
      topic: sample_topic.first,
      user: sample_user.first,
      text: lorem(6, 50)
    ]
  end

end

admin = User.create! do |u|
  u.email = 'admin@example.com'
  u.password = 'password'
  u.password_confirmation = 'password'
end
