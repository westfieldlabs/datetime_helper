# The Datetime Helper

A collection of useful utilities for projects that have to deal with dates, times, and time zones, with particular utility for Rails projects that enforce the use of Zulu Time.

## Features

1. A base method called `is_zulu_time?`, 
2. `rspec` matchers `be_zulu_time`, `be_an_iso_formatted_date`, and `be_an_iso_formatted_time`
3. An `ActiveModel` validator called `zulu_time`, and
4. An `ActiveModel::Serializer` helper method called `enforce_zulu_time`.

Each feature can be required individually so you can use the `rspec` matcher, `ActiveModel` validator, or `ActiveModel::Serializer` helper in isolation.

[![Build Status](https://travis-ci.org/westfieldlabs/datetime_helper.svg?branch=master)](https://travis-ci.org/westfieldlabs/datetime_helper)

## Requirements

1. `Ruby`, `Bundler`, etc. The usual suspects. (Tested against Ruby 2.0.0 and up)
2. `rspec` if you `require 'datetime_helper/rspec'`
3. `active_model` if you `require 'datetime_helper/active_model'`
4. `active_model_serializer` if you `require 'datetime_helper/active_model_serialiser'`

## TL;DR

Zulu Time is an ISO 8601 formatted string representing a `datetime` but in the time zone UTC+0. This makes it trivial for client applications to display dates and times correctly in their local, or other nominated time zones.

Enforcing Zulu Time across a range of projects requires a common approach to validating incoming strings, representing the data internally, serialising the data back out into strings, and testing date and time fields.

The `Datetime Helper` was developed to provide that common approach, and it is available as an open source project because we believe it is generically useful.

## To use

Put this in your `Gemfile`

```ruby
gem 'datetime_helper'
```

### Basic Zulu Time checking

You can also use this to test that a `DateTime`, or `Time`, are at `UTC+0`, or
that a `String` is formatted in correct Zulu Time format.

```ruby
DatetimeHelper.is_zulu_time? something
```

### Using the `be_zulu_time` matcher in your `RSpec` tests

Put this in your `spec_helper.rb` or equivalent

```ruby
require 'datetime_helper/rspec'

RSpec.configure do |config|
  config.include DatetimeHelper::Matchers
end
```

And put this in your `rspec` tests.

```ruby
it {expect(subject[:deleted_at]).to be_zulu_time}
```

This can be used to expect that a `DateTime`, or `Time`, are at `UTC+0`, or that a `String` is formatted in Zulu Time.

#### ISO Times and Dates

Similarly to the above you can also test Time and Date strings with

* `be_an_iso_formatted_time`, and
* `be_an_iso_formatted_date`

### Validating `ActiveModel` fields to ensure they hold UTC+0 `datetime` data

First be sure you `require 'datetime_helper/active_model'`

Then your model class can add:

```ruby
include DatetimeHelper::Validators

validates :updated_at, zulu_time: true
```

This will verify that a `Time` is supplied at `UTC+0`,
or that a `DateTime` has `.zone == "+00:00"`,
or that a `String` is in Zulu Time format.

### Enforcing `ActiveModel::Serializer`  Zulu Time string formats

First be sure you `require 'datetime_helper/active_model_serialiser'`

Then you can put this in your serialisers:

```ruby
extend DatetimeHelper::Serialisers

enforce_zulu_time :updated_at
```

or if you have a bunch of 'em

```ruby
extend DatetimeHelper::Serialisers

%w(updated_at deleted_at).each { |attribute| enforce_zulu_time attribute }
```

This will ensure that the serialised output is a proper Zulu Time formatted string.

## To build

```sh
bundle install
gem build datetime_helper.gemspec
```

## To test

```sh
bundle install
rake
```

The tests offer insight into how to use these utilities.

## To contribute

Contributions are encouraged. See the [contribution instructions](contributing.md) for the preferred contribution process.

## License

The `Datetime Helper` is © 2015 Westfield Labs and is available for use under the [Apache 2.0](LICENSE) license.

## Version history

|Version| Comments                                   |
|:------|:-------------------------------------------|
|`0.0.1`| First draft — only the rspec matcher       |
|`0.0.2`| Added the `ActiveModel` validator          |
|`0.0.3`| Added the `ActiveModel::Serializer` helper |
|`1.0.0`| Cleaned up for first official release      |
|`1.0.1`| Enhanced matchers, and validator           |
