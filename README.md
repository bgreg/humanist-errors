[![Code Climate](https://codeclimate.com/github/bgreg/humanist-errors/badges/gpa.svg)](https://codeclimate.com/github/bgreg/humanist-errors)[![Test Coverage](https://codeclimate.com/github/bgreg/humanist-errors/badges/coverage.svg)](https://codeclimate.com/github/bgreg/humanist-errors)[![Build Status](https://travis-ci.org/bgreg/humanist-errors.svg?branch=master)](https://travis-ci.org/bgreg/humanist-errors)

# Humanist::Errors

[![Join the chat at https://gitter.im/bgreg/humanist-errors](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/bgreg/humanist-errors?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'humanist-errors'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install humanist-errors

## Usage

TODO: Write usage instructions here

This gem is intended for use in development environments only.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/humanist-errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## TODO
1. Look at the C source, and re-evaluate the error message lookup approach we are using. 
2. Stop patching individual exceptions. 
2. Testing strategy could be improved.  Look at simply raising exceptions instead of trying to eval syntax errors
