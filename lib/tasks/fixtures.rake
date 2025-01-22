require Rails.root.join("lib/tasks/fixture_generator.rb")

namespace :fixtures do
  desc "Generate fixtures for all models"
  task generate: :environment do
    FixtureGenerator.generate_fixtures("Template", "test/fixtures/templates.yml")
    FixtureGenerator.generate_fixtures("GeneratorOption", "test/fixtures/generator_options.yml")
    FixtureGenerator.generate_fixtures("Application", "test/fixtures/applications.yml")
  end
end
