rails generate scaffold Template \
  name:string \
  slug:string:uniq \
  path:string \
  description:text

rails generate scaffold GeneratorOption \
  name:string:uniq \
  slug:string:uniq \
  options:jsonb \
  template:references

rails generate scaffold Application \
  name:string \
  slug:string:uniq \
  rails_version:string \
  repository_url:string \
  status:string \
  generator_option:references \
  template:references


IDEA: you should use PostgreSQL if you want to use:
- PostgreSQL extensions: PostGIS....
- logidze gem
- JSONb indexing
- Add using of Raisl Actions (http://localhost:3000/rails/actions)


# DOCKER
Run the following command to manually create the development database:
docker-compose exec db psql -U postgres -c "CREATE DATABASE railsnew_development;"

Then, verify its existence:
docker-compose exec db psql -U postgres -l

# What files depends on DB type?
- [x] .github/workflows/ci.yml
- [x] config/database.yml
- [ ] ....

