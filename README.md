# NJ

## Status

[![Lint](https://github.com/janschill/njonassimons.de/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/janschill/njonassimons.de/actions/workflows/lint.yml) [![Test](https://github.com/janschill/njonassimons.de/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/janschill/njonassimons.de/actions/workflows/test.yml) [![CodeQL](https://github.com/janschill/njonassimons.de/actions/workflows/codeql-analysis.yml/badge.svg?branch=main)](https://github.com/janschill/njonassimons.de/actions/workflows/codeql-analysis.yml)

## First Deploy

```sh
rails db:setup
rails db:migrate
rails spina:first_deploy
```

Copy .env
Install docker-compose
`rm config/credentials.yml.enc` then in local Docker run: `RAILS_ENV=production bin/rails credentials:edit`, save master.key in password manager
add to .env
https://guides.rubyonrails.org/security.html#custom-credentials

## Things Done

```sh
# Set project name
export project_name=nj
mkdir $project_name && cd $project_name
# Set Ruby version
echo "3.1.0" >> .ruby-version
# Init a new Rails project with Postgres
rails new . --database=postgresql
# Create remote GitHub repository
gh repo create $project_name --private
# Set remote for local git project
git remote add origin git@github.com:janschill/$project_name.git
git add .
git commit -m "Install Rails"
# Create database, postgres needs to be running (maybe stick with sqlite)
rails db:create
# Add Spina to Gemfile [if wanted]
echo "\ngem \"spina\", \"~> 2.2\"" >> Gemfile
bundle install
# Install ActiveStorage for media
rails active_storage:install
# Enable image_processing, macOS version, Linux without the extra ''
sed -i '' 's/# gem \"image_processing\"/gem \"image_processing\"/g' Gemfile
# Install
bundle install
# Make sure OS dependencies are installed
brew install libvips ffmpeg poppler
# Install Spina and run migrations
# This expects inputs, so will not work automated
rails g spina:install
```
