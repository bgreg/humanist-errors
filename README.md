[![Code Climate](https://codeclimate.com/github/bgreg/humanist-errors/badges/gpa.svg)](https://codeclimate.com/github/bgreg/humanist-errors)[![Test Coverage](https://codeclimate.com/github/bgreg/humanist-errors/badges/coverage.svg)](https://codeclimate.com/github/bgreg/humanist-errors)[![Build Status](https://travis-ci.org/bgreg/humanist-errors.svg?branch=master)](https://travis-ci.org/bgreg/humanist-errors)

# Error messages for Humans.

[![Join the chat at https://gitter.im/bgreg/humanist-errors](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/bgreg/humanist-errors?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Humanist errors is a system for extending ruby exception messages.  It will prepend the standard output with text
defined in the humanist errors dictionary that hopefully explains what is going on a little better.
![img](https://cloud.githubusercontent.com/assets/3711139/11139081/9ed4493a-897f-11e5-8589-79a4e5930c94.png)
![img](https://cloud.githubusercontent.com/assets/3711139/11139050/3ccefb40-897f-11e5-8024-9062ce4787bf.png)


## Installation

Add this line to your application's Gemfile:

	gem 'humanist-errors'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install humanist-errors


## Usage

You can use humanist errors globally in your project, or only around specific pieces of code.
To use globally:

Require the library and monkey file

	require 'humanist_errors'
	require 'humanist_errors/monkey'

Thats it! No when ruby tries to evaluate an error like when you say: `1/0` you will see a new error message.


Now, if you only want to see new errors in an isolated area you can include the library and execute
your code inside a special code block.

1. Add these require statements to your file:

  `require 'humanist_errors'`

  `require 'humanist_errors/monkey'`
  
2. Include the humanist errors module:

  `include HumanistErrors`

3. Then your code in a human block:
```ruby
	with_human_errors do
      		#....
	end
```

This gem is intended for use in development and test environments only.

## Contributing

1. Fork it ( https://github.com/bgreg/humanist-errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## TODO
1) add more errors from this list to the error_map

##### High level exception tree:

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
