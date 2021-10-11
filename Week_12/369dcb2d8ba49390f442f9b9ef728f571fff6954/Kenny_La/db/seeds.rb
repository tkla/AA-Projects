# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def random_understanding
  responses = [
    'Extremely comfortable. It\'s easy. Would ace the assessment.',
    'Confident I understand all.',
    'Have general understanding, but do not yet own it.',
    'Struggled with some concepts.'
  ]
  responses.sample
end

def random_improvement
  peers = %w(Luke Debra Tyler Todd Winston)
  technologies = %w(Ruby ActiveRecord Git Rails SQL Postgres RSpec
    Capybara JavaScript ES5 ES6 jQuery Jasmine React Redux Jest
  )
  interjections = %w(Dang Whoa Wow Geez Golly)

  peer = peers.sample
  technologies = technologies.sample(2)
  interjection = interjections.sample

  first = "#{interjection}, I wish I knew #{technologies[0]} as well as #{peer}."
  second = "Also, I need to get better at #{technologies[1]}."
  [first, second].join(' ')
end

def random_evening_time(date)
  random_hour = (19..22).to_a.sample
  zero_to_sixty = (0..59).to_a
  random_minute = zero_to_sixty.sample
  random_second = zero_to_sixty.sample
  date.change(
    hour: random_hour,
    min: random_minute,
    sec: random_second
  )
end

def random_future_time(date)
  one_to_thirty = (1..30).to_a
  random_offset = one_to_thirty.sample
  date + random_offset.minutes
end

Report.delete_all

start_date = DateTime.new(2016, 9, 12)
end_date = DateTime.new(2016, 11, 1)

(start_date..end_date).each.with_index(1) do |date, i|
  is_saturday = (i + 1) % 7 == 0
  is_sunday = i % 7 == 0
  next if is_saturday || is_sunday

  created_at = random_evening_time(date)
  report_is_updated = [true, false].sample
  if report_is_updated
    updated_at = random_future_time(created_at)
  else
    updated_at = created_at
  end
  Report.create!(
    understanding: random_understanding,
    improvement: random_improvement,
    created_at: created_at,
    updated_at: updated_at
  )
end
