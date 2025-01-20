bin/rails generate model Application \
  name:string \
  slug:string:unique \
  rails_version:string \
  parameters:jsonb \
  repository_url:string \
  status:string:default:"draft" \
  template:references


IDEA: you should use PostgreSQL if you want to use:
- PostgreSQL extensions: PostGIS....
- logidze gem
- JSONb indexing




# DOCKER
Run the following command to manually create the development database:
docker-compose exec db psql -U postgres -c "CREATE DATABASE railsnew_development;"

Then, verify its existence:
docker-compose exec db psql -U postgres -l

