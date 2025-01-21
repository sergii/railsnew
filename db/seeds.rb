# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

load Rails.root.join('db/seeds/templates.rb')
load Rails.root.join('db/seeds/generator_options.rb')
load Rails.root.join('db/seeds/applications.rb')


if ENV['UPDATE_FIXTURES'] == 'true'
  # Generate fixtures
  require Rails.root.join('lib/tasks/fixture_generator.rb')

  puts "Starting the seeding process..."

  # Run the Rake task
  puts "Calling the Rake task to generate fixtures..."
  Rake::Task.clear # Clear any previously loaded tasks to avoid duplicate task invocation
  Rails.application.load_tasks # Load the Rake tasks
  Rake::Task["fixtures:generate"].invoke

  puts "Finished generating fixtures!"
end
