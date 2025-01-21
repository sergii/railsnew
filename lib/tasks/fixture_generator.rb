require 'fileutils'

# Example usage:
#
# FixtureGenerator.generate_fixtures("Template", "test/fixtures/templates.yml")
#
module FixtureGenerator
  def self.generate_fixtures(model_name, output_file)
    begin
      model_class = model_name.constantize
    rescue NameError
      puts "Warning: Model #{model_name} does not exist. Skipping..."
      return
    end

    puts "Starting to generate fixtures for #{model_name} records..."

    # Backup existing fixture file if it exists
    if File.exist?(output_file)
      backup_file = "#{output_file}.bak"
      FileUtils.cp(output_file, backup_file)
      puts "Backup created: #{backup_file}"
    end

    # Open the fixture file and rewrite its contents
    File.open(output_file, "w") do |file|
      file.puts "---" # YAML file header
      total_records = model_class.count
      puts "Found #{total_records} #{model_name} record(s) in the database."

      model_class.find_each.with_index(1) do |record, index|
        cleaned_attributes = record.attributes.except("id").merge(
          "created_at" => record.created_at.strftime('%Y-%m-%d %H:%M:%S'),
          "updated_at" => record.updated_at.strftime('%Y-%m-%d %H:%M:%S')
        )

        file.puts({
          "#{model_name.downcase}_#{record.id}" => cleaned_attributes
        }.to_yaml.sub(/^---\s*/, ''))

        puts "Processed #{model_name} ##{index} (ID: #{record.id})"
      end
    end

    puts "Fixtures have been successfully written to #{output_file}."
  end
end
