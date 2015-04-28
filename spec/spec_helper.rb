if defined?(SimpleCov)
  SimpleCov.start do
    add_group 'Main', '/lib/'
    add_filter "/spec/"
  end
end

require 'westfield_datetime_helper'

# Dir[File.expand_path("./support/**/*.rb",__FILE__)].each { |f| require f }

RSpec.configure do |config|

  config.include WestfieldLabs::DatetimeHelper::Matchers

  # config.expect_with :rspec do |c|
  #   c.syntax = :expect
  # end

  # If no example or groups contains the filter symbol below, then run all
  config.run_all_when_everything_filtered = true
  # If supplied, run only those examples and groups with the symbol below
  # i.e. it "some text", :focus do
  config.filter_run_including :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Hi I'm Dave I like pretty colours.
  config.color = true
  config.tty = true
  config.formatter = :documentation

end
