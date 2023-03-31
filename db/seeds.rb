# Create a user
User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
User.create(name: 'Jane Smith', email: 'jane@example.com', password: 'password')
User.create(name: 'Bob Johnson', email: 'bob@example.com', password: 'password')

# create some categories
categories = Category.create([{ name: 'Work' }, { name: 'Personal' }])

# Seed data for tasks
10.times do
    Task.create(
      name: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      due_date: Faker::Date.forward(days: 23),
      status: ["pending", "in progress", "completed"].sample,
      priority: rand(1..5),
      user_id: User.all.sample.id,
      category_id: Category.all.sample.id
    )
  end
# create 10 reminders for random tasks
10.times do
    reminder = Reminder.create(
      task_id: rand(1..10),
      reminder_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 7.days),
      reminder_message: Faker::Lorem.sentence(word_count: 5)
    )
  end