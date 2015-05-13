require 'datetime_helper/rspec'
require 'pry'  # for debugging
require 'time' # used all over the place

RSpec.configure do |config|

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

  config.include DatetimeHelper::Matchers

end
