# The Westfield Datetime Helper

A collection of useful utilities for projects that have to deal with dates, times, and timezones.

### Currnt Status: Initial Development

It's not ready for actual use yet, and not in `rubygems`.

## TL;DR

Zulu Time is an ISO 8601 formatted string representing a `datetime` but in the time zone UTC+0. This makes it trivial for client applications to display correctly in their local, or other nominated time zones.

Enforcing Zulu Time across a range of projects requires a common approach to how you validate incoming strings, how you represent the data internally, how you serialise the data back out into strings, and how you test all that consistently and efficiently.

`Datetime Helper` provides that common approach.

## To use

Put this in your `Gemfile`

```ruby
gem 'westfield_datetime_helper', git: "http://github.com/westfieldlabs/datetime_helper.git"
```

Put this in your model for datetime fields that must be stored as UTC+0

```ruby
validates :updated_at, zulu_time: true
```

Put this in your serialisers

```ruby
%w(updated_at deleted_at).each { |attribute| in_zulu_time attribute }
```

Put this in your `rspec` tests.

```ruby
it {expect(subject[:deleted_at]).to be_zulu_time}
```

## To build

```sh
bundle install
gem build westfield_datetime_helper.gemspec
```

## To test

```sh
bundle install
rspec
```

## To contribute

Contributions are welcome.  See the contribution instructions for the preferred contribution process.

