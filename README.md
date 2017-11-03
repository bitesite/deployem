# Deploy'em

Deploy'em is a simple deployment tool for Rails apps that are deployed to Heroku for teams that follow a git-flowish strategy. We say 'git-flowish' because it's not strictly gitflow. 

**It's basically a collection of Rake tasks.**

## Git and Heroku Deployment Strategy

This gem is based on the idea that you have 2 branches in your git repository and each one of them has a associated Heroku app:

- master branch that is deployed to a Heroku Production server
- develop branch that is deployed to a Heroku Staging server

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deployem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deployem

## Setup Steps

For this gem to work, you'll need to have the following setup

- a master branch in your Git repository
- a develop branc in your Git repository
- a heroku app who's remote is named 'heroku'
- a heroku app who's remote is named 'heroku-staging'

You'll also need to have the Heroku CLI installed if you're going to take advantage of the DB migrations part.

## Usage

This gem is a collection of rake tasks, so after installing it, simply run the rake tasks:

### Deploy Staging

Run:

    rake deploy:staging

Which will basically run a ```git push heroku-staging develop:master``` and then ask you if you want to run DB migrations which will in turn will run ```heroku run rake db:migrate -r heroku-staging````.

### Deploy Production

Run:

    rake deploy:production

Which will basically run a ```git push heroku master:master``` and then ask you if you want to run DB migrations which will in turn will run ```heroku run rake db:migrate -r heroku````.



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bitesite/deployem.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

