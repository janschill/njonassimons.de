# NJ

## Things Done

```sh
# set project name
export project_name=nj
mkdir $project_name && cd $project_name
# set Ruby version
echo "3.1.0" >> .ruby-version
# init a new Rails project with Postgres
rails new . --database=postgresql
# create remote GitHub repository
gh repo create $project_name --private
# set remote for local git project
git remote add origin git@github.com:janschill/$project_name.git
git add .
git commit -m "Install Rails"
# create database, postgres needs to be running (maybe stick with sqlite)
rails db:create
# Add Spina to Gemfile [if wanted]
echo "\ngem \"spina\", \"~> 2.2\"" >> Gemfile
bundle install
# Install ActiveStorage for media
rails active_storage:install
# Install Spina and run migrations
# This expects inputs, so will not work automated
rails g spina:install
```
