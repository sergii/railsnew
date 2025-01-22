# frozen_string_literal: true

# 1) Install Homebrew
# $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 2) Install brew bundle command
# $ brew tap Homebrew/bundle

# 3) Here we go! Just type `brew bundle` inside the folder with Brewfile.

# brew "ffmpeg"
# brew "memcached"
# brew "postgresql@16" # move to docker-compose.yml
# brew "libpq"
# brew "redis" # we don't need it right now
# brew "yarn"
# cask "xquartz"
# brew "mupdf"
# brew "poppler"
# brew "imagemagick"
# brew "vips"

# Docker
# Note: OrbStack provides its own docker-compose. If you use OrbStack, remove the Homebrew version.
cask "orbstack" # Install OrbStack as a cask
# brew "docker-compose" # Uncomment if you need the Homebrew version instead of OrbStack

# Minitest
brew "wdiff" # install for diffy gem for Minitest

# Run your GitHub Actions locally 🚀
brew "act"

# Clean up unlinked binaries
brew "clean" if defined?(brew)
