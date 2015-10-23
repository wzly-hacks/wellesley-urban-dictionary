# wellesley-urban-dictionary
An urban dictionary for Wellesley College. Users can explore, vote on, and contribute to this collection of colloquialisms. 

### This project uses the following tools:
- [Hound](https://houndci.com/) by [thoughtbot](https://thoughtbot.com/). Hound comments on pull requests when style violations are found.
- [Devise](https://github.com/plataformatec/devise) for authentication.
- [Pundit](https://github.com/elabs/pundit) for authorization.
- [Sendgrid](https://addons.heroku.com/sendgrid) for email functionality.
- [Figaro](https://github.com/laserlemon/figaro) for app configuration.
- [Faker](https://github.com/stympy/faker) for seeding data.
- [Redcarpet](https://github.com/vmg/redcarpet) for Markdown support.
- [RSpec](https://github.com/rspec/rspec-rails), [FactoryGirl](https://github.com/thoughtbot/factory_girl_rails), and [Capybara](https://github.com/jnicklas/capybara) for tests.
- [Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4) for app hosting


### Cloning the Project

- Checklist for setting up a Rails Dev env: http://railsapps.github.io/installrubyonrails-mac.html

### Rails command reference

This is an annotated list of commands I used in this project.

```
#create project specific Gemset and install Rails
rvm use ruby-2.2.3@wzly_dict --ruby-version --create
gem install rails --version=4.1.6

#create new project in current directory. Exclude standard unit test packages.
rails new . -T

#create the database if not already created
rake db:create

#create a few welcome views. need a controller to go along with that
rails g controller welcome index about

rake routes

#create new models
rails g model Entry title:string body:text
rails g model Comment body:text entry:references
rake db:migrate

#add rspec
rails g rspec:install
```

### Heroku command reference

```
$ heroku login
$ heroku create <app name>
$ git push heroku master
```

