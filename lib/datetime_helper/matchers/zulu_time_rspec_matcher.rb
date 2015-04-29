module Labs
  module DatetimeHelper
    module Matchers
      
      RSpec::Matchers.define :be_zulu_time do |expected|
        match { |datetime| DatetimeHelper.is_zulu_time?(datetime) }
      end
    end
  end
end
