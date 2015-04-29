# The Westfield Datetime Helper

A collection of useful utilities for projects that have to deal with dates, times, and timezones.

### Current Status: Rspec Matchers done

1. The `rspec` matcher `be_zulu_time` has been implemeted.
2. The `zulu_time` `ActiveModel` validator has been implemented.

#### Remaining to do

2. `in_zulu_time` ActiveModel::Serializer support method

## TL;DR

Zulu Time is an ISO 8601 formatted string representing a `datetime` but in the time zone UTC+0. This makes it trivial for client applications to display correctly in their local, or other nominated time zones.

Enforcing Zulu Time across a range of projects requires a common approach to how you validate incoming strings, how you represent the data internally, how you serialise the data back out into strings, and how you test all that consistently and efficiently.

`Datetime Helper` provides that common approach.

## To use

Put this in your `Gemfile`

```ruby
gem 'westfield_datetime_helper', git: "http://github.com/westfieldlabs/datetime_helper.git"
```

### In your `RSpec` tests

Put this in your `spec_helper.rb` or equivalent

```ruby
require 'westfield_datetime_helper/rspec'

RSpec.configure do |config|
  config.include WestfieldLabs::DatetimeHelper::Matchers
end
```

And put this in your `rspec` tests.

```ruby
it {expect(subject[:deleted_at]).to be_zulu_time}
```

### Validating model fields

Put this in your model for datetime fields that must be stored as UTC+0

First be sure you `require 'westfield_datetime_helper/active_model'`

Then your model class can add:

```ruby
include WestfieldLabs::DatetimeHelper::Validators

validates :updated_at, zulu_time: true
```

This will verify that a `Time` is supplied at `UTC+0`, or that a `DateTime` has `.zone = "+00:00"`.

You can also simply test a string to see if it is a Zulu Time string by

```ruby
WestffieldLabs::DatetimeHelper.is_zulu_time?(some_string)
```

### Enforcing serialised output formats

First be sure you `require 'westfield_datetime_helper/active_model_serialisers'`

Then you can put this in your serialisers (assumes fields `updated_at`, and `deleted_at`)

```ruby
extend WestfieldLabs::DatetimeHelper::Serialisers

in_zulu_time :updated_at
```

or if you have a bunch of 'em

```ruby
extend WestfieldLabs::DatetimeHelper::Serialisers

%w(updated_at deleted_at).each { |attribute| in_zulu_time attribute }
```

## To build

```sh
bundle install
gem build westfield_datetime_helper.gemspec
```

## To test

```sh
bundle install
rake
```

## To contribute

Contributions are welcome.  See the [contribution instructions](contributing.md) for the preferred contribution process.
