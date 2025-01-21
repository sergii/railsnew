puts ""
puts "Seeding templates..."

templates = [
  {
    name: 'rails new --minimal template',
    slug: 'minimal_template',
    path: 'templates/minimal',
    description: 'A standard template with --minimal configuration.'
  },
  {
    name: 'rails new --api template',
    slug: 'api_template',
    path: 'templates/api',
    description: 'A template optimized for API-only applications.'
  }
]

templates.each do |template|
  created = Template.find_or_create_by!(slug: template[:slug]) do |t|
    t.name = template[:name]
    t.path = template[:path]
    t.description = template[:description]
  end

  puts "  - #{created.name} (#{created.slug})"
end
