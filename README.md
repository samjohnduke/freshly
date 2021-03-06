# Freshly
[![Build Status](https://travis-ci.org/samjohnduke/freshly.svg?branch=master)](https://travis-ci.org/samjohnduke/freshly) [![Gem Version](https://badge.fury.io/rb/freshly.svg)](https://badge.fury.io/rb/freshly)

Freshly is a Ruby API wrapper for the Freshdesk API v2

## BETA
The API that sits behind this library is currently in a beta form and as such may change and any notice. Please do not use this in production unless you understand the risks of using it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freshly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freshly

## Usage

Create a new API client using your Freshdesk API key and your api endpoint
(the login url eg. https://skylarklabs.freshdesk.com)

```
client = Freshly::Client.new api_key: {api_key}, api_endpoint: {api_endpoint}
```

or

```
client = Freshly::Client.new
client.configure do |opts|
  opts.api_key = {api_key}
  opts.api_endpoint = {api_endpoint}
end
```


Resources that are available are
- Tickets

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/samjohnduke/freshly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
