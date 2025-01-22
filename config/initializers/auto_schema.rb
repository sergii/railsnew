# ActiveRecord::Migration.class_eval do
#   after_commit :dump_schema

#   private

#   def dump_schema
#     Rails.logger.info "Regenerating schema.rb..."
#     ActiveRecord::Tasks::DatabaseTasks.dump_schema(Rails.env)
#   end
# end

# Rake::Task["db:migrate"].enhance do
#   Rails.logger.info "Automatically dumping schema.rb after migration"
#   Rake::Task["db:schema:dump"].invoke
# end
