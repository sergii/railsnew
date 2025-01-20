puts "Seeding generator options..."

generator_options = [
  {
    name: 'Default Options',
    slug: 'default-options',
    options: {
      database: 'postgresql',
      css_framework: 'tailwind',
      javascript_bundler: 'esbuild'
    },
    template_slug: 'standard-template'
  },
  {
    name: 'API Options',
    slug: 'api-options',
    options: {
      database: 'mysql',
      skip_javascript: true,
      api_mode: true
    },
    template_slug: 'api-template'
  }
]

generator_options.each do |gen_option|
  template = Template.find_by(slug: gen_option[:template_slug])
  if template
    created = GeneratorOption.find_or_create_by!(slug: gen_option[:slug]) do |go|
      go.name = gen_option[:name]
      go.options = gen_option[:options]
      go.template = template
    end

    puts "  - #{created.name} (#{created.slug}) linked to template #{template.name}"
  else
    puts "  - Skipped: Template with slug #{gen_option[:template_slug]} not found."
  end
end

puts "Generator options seeding complete!"
