puts ""
puts "Seeding applications..."

applications = [
  {
    rails_version: '8.0.0',
    name: 'Rails 8.0.0 minimal app',
    slug: 'rails_8_0_0_minimal_app',
    description: "Rails 8.0.0 minimal app with defaults in order to try the in-build functionality",
    repository_url: 'https://github.com/username/rails_8_0_0_minimal_app',
    status: 'active',
    generator_option_slug: "generator_options_minimal",
    template_slug: "minimal_template"
  },
  {
    rails_version: '8.0.0',
    name: 'Rails 8.0.0 API app',
    slug: 'rails_8_0_0_api_app',
    description: "Rails 8.0.0 app in API mode with defaults in order to try the in-build functionality",
    repository_url: 'https://github.com/username/rails_8_0_0_api_app',
    status: 'active',
    generator_option_slug: "generator_options_api",
    template_slug: "api_template"
  },
]

applications.each do |app|
  generator_option = GeneratorOption.find_by(slug: app[:generator_option_slug])
  template = Template.find_by(slug: app[:template_slug])

  if generator_option && template
    created = Application.find_or_create_by!(slug: app[:slug]) do |a|
      a.rails_version = app[:rails_version]
      a.name = app[:name]
      a.description = app[:description]
      a.repository_url = app[:repository_url]
      a.status = app[:status]
      a.generator_option = generator_option
      a.template = template
    end

    puts "  - #{created.name} (#{created.slug}) linked to generator option #{generator_option.name} and template #{template.name}"
  else
    puts "  - Skipped: Missing generator option or template for application #{app[:slug]}"
  end
end

puts "Applications seeding complete!"
