json.extract! application, :id, :rails_version, :name, :slug, :description, :repository_url, :status, :generator_option_id, :template_id, :created_at, :updated_at
json.url application_url(application, format: :json)
