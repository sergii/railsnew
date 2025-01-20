puts "Seeding applications..."

applications = [
  {
    name: 'My First App',
    slug: 'my-first-app',
    rails_version: '8.0.0',
    repository_url: 'https://github.com/sergii/my-first-app',
    status: 'active',
    generator_option_slug: 'default-options',
    template_slug: 'standard-template'
  },
  {
    name: 'API Service',
    slug: 'api-service',
    rails_version: '8.0.0',
    repository_url: 'https://github.com/sergii/api-service',
    status: 'draft',
    generator_option_slug: 'api-options',
    template_slug: 'api-template'
  }
]

applications.each do |app|
  generator_option = GeneratorOption.find_by(slug: app[:generator_option_slug])
  template = Template.find_by(slug: app[:template_slug])

  if generator_option && template
    created = Application.find_or_create_by!(slug: app[:slug]) do |a|
      a.name = app[:name]
      a.rails_version = app[:rails_version]
      a.repository_url = app[:repository_url]
      a.status = app[:status]
      a.generator_option = generator_option
      a.template = template
    end

    puts "  - #{created.name} (#{created.slug}) linked to generator option #{generator_option.name} and template #{template.name}"
  else
    puts "  - Skipped: Missing generator option or template for application #{app[:name]}"
  end
end

puts "Applications seeding complete!"
