# Create users
5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end
# Create categories
categories = Category.create([
  { name: 'Work' },
  { name: 'Personal' },
  { name: 'Health' },
  { name: 'Education' },
  { name: 'Finance' }
])
# Create tasks
20.times do
  Task.create(
    name: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    due_date: Faker::Date.forward(days: 23),
    status: ["pending", "in progress", "completed"].sample,
    priority: rand(1..5),
    user: User.all.sample,
    category: categories.sample,
    language: "English"
  )
end
# Create reminders for tasks
10.times do
  Reminder.create(
    task: Task.all.sample,
    reminder_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 7.days),
    reminder_message: Faker::Lorem.sentence(word_count: 5)
  )
end