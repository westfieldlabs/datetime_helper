module WestfieldLabs
  module DatetimeHelper
    module Matchers
      ZULU_TIME_PATTERN = /^\d{4}-[0-1][0-9]-[0-3]\d{1}T[0-2]\d{1}:[0-5]\d{1}:[0-5]\d{1}Z$/
      
      RSpec::Matchers.define :be_zulu_time do |expected|
        match do |datetime|
          !(datetime =~ ZULU_TIME_PATTERN).nil?
        end
      end
    end
  end
end
