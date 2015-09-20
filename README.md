[![Code Climate](https://codeclimate.com/github/bgreg/humanist-errors/badges/gpa.svg)](https://codeclimate.com/github/bgreg/humanist-errors)[![Test Coverage](https://codeclimate.com/github/bgreg/humanist-errors/badges/coverage.svg)](https://codeclimate.com/github/bgreg/humanist-errors)[![Build Status](https://travis-ci.org/bgreg/humanist-errors.svg?branch=master)](https://travis-ci.org/bgreg/humanist-errors)

# Humanist::Errors

[![Join the chat at https://gitter.im/bgreg/humanist-errors](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/bgreg/humanist-errors?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Humanist errors is a system for extending ruby exception messages. 
It will prepend the standard output with text defined in the humanist errors dictionary.

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

Include humanist errors in your project, and when ever you want better errors wrap your code like this: 

```ruby 
with_human_errors do
  #...
end
```
This gem is intended for use in development and test environments only.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/humanist-errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## TODO
1) fill out tests for search.rb 

High level exception tree:
----
```ruby
Exception
  NoMethodError
  ScriptError
    LoadError
    NotImplementedError
    SyntaxError
  SignalException
    Interrupt
  StandardError
    ArgumentError
    IOError
      EOFError
    IndexError
    LocalJumpError
    NameError
      NoMethodError
    RangeError
      FloatDomainError
    RuntimeError
    SecurityError
    SystemCallError
    SystemStackError
    ThreadError
    ZeroDivisionError
  SystemExit
  fatal
```
