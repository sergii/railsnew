puts "Seeding templates..."

templates = [
  {
    name: 'Standard Template',
    slug: 'standard-template',
    path: 'templates/standard',
    description: 'A standard template with default configurations.'
  },
  {
    name: 'API Template',
    slug: 'api-template',
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

puts "Templates seeding complete!"
