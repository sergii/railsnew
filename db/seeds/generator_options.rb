puts ""
puts "Seeding generator options..."

generator_options = [
  {
    name: "Default '--minimal' options",
    slug: 'generator_options_minimal',
    options: {
      database: 'postgresql',
      css_framework: 'tailwind',
      javascript_bundler: 'esbuild'
    },
    description: "Rails 8.0.0 minimal app with defaults in order to try the in-build functionality",
    template_slug: 'minimal_template'
  },
  {
    name: "Default '--api' options",
    slug: 'generator_options_api',
    options: {
      database: 'mysql',
      skip_javascript: true,
      api_mode: true
    },
    description: "Rails 8.0.0 API mode app with defaults in order to try the in-build functionality",
    template_slug: 'api_template'
  }
]

generator_options.each do |gen_option|
  template = Template.find_by(slug: gen_option[:template_slug])
  if template
    created = GeneratorOption.find_or_create_by!(slug: gen_option[:slug]) do |go|
      go.name = gen_option[:name]
      go.options = gen_option[:options]
      go.description = gen_option[:description]
      go.template = template
    end

    puts "  - #{created.name} (#{created.slug}) linked to template #{template.name}"
  else
    puts "  - Skipped: Template with slug #{gen_option[:template_slug]} not found."
  end
end

puts "Generator options seeding complete!"
