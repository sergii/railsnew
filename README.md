# Our Best practices
1. Use docker-compose.yml for run both local and test PostgreSQL instance.
2. Use polished ci.yml to run fast, efficient, prominent linters and test on GitHub actions.
3. Use Act (bin/act) to test GitHub Actions locally.
4. Use cuprite gem to run system tests.
5. Use bin/*scripts* to run various useful task. Use bin/help to get additional info.

## Local Development with Act

1. Ensure Docker is installed and running.
2. Run the following command to set up the Docker context and run Act:

  ```bash
  bin/act

  or to tun specific GitHub CI job:

  ```bash
  bin/act -j job-name


### Best Practices
- **Keep Hooks in Version Control**: Storing hooks in the repository ensures they are consistent across developers.
- **Automate Installation**: Use a script like `bin/setup` to symlink or configure hooks during project setup.
- **Document Usage**: Add instructions in the `README.md` or `CONTRIBUTING.md` file so team members understand how to use and manage hooks.

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
