module DatetimeHelper
  module Matchers
    
    RSpec::Matchers.define :be_an_iso_formatted_time do |expected|
      match do |time|
        !(time =~ /\d{2}:\d{2}/).nil?
      end
    end

    RSpec::Matchers.define :be_an_iso_formatted_date do |expected|
      match do |date|
        !(date =~ /\d{4}\-\d{2}\-\d{2}/).nil?
      end
    end

  end
end
