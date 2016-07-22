# JSONHasher

[![Build Status](https://travis-ci.org/nickpoorman/ruby_json_hasher.svg?branch=master)](https://travis-ci.org/nickpoorman/ruby_json_hasher)

Create a stable SHA-2 hash from a JSON object.

JSON objects do not require the keys to be in any kind of order which can make creating a hash unstable. This gem solves that problem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_hasher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_hasher

## Usage

```ruby
test_json_one = '[{ "foo": "bar", "ping": "pong" }]'
test_json_two = '[{ "ping": "pong", "foo": "bar" }]'

hashed_one = JSONHasher::Parser.new(test_json_one).to_sha2
hashed_two = JSONHasher::Parser.new(test_json_two).to_sha2

# hashed_one: c15915ccb473c4cecca65f940f6a36091f70333b9e8226dfe51ca247c73e56f1
# hashed_two: c15915ccb473c4cecca65f940f6a36091f70333b9e8226dfe51ca247c73e56f1

assert_equal hashed_one, hashed_two
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nickpoorman/ruby_json_hasher.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
