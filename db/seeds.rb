# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating user...'
user = User.create(email: 'test@test.test', password: 'abc123456', password_confirmation: 'abc123456')

puts 'Creating events...'
current_date = Date.current
event_data_map = (1..300).map do |i|

  {
    user_id: user.id,
    name: "#{Faker::Name.name} birthday",
    date: current_date + i.day
  }
end
events = Event.create(event_data_map)

puts 'Creating todo lists...'
todo_lists_data_map = events.map do |event|
  {
    event_id: event.id,
    memo: Faker::Markdown.emphasis
  }
end
TodoList.create(todo_lists_data_map)