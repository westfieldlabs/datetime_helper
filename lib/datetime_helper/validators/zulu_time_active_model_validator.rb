# Validates that a supplied value is in fact
# a DateTime, and is in timezone UTC+0
require 'time'
require 'active_model'

module DatetimeHelper
  module Validators
    class ZuluTimeValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        return if DatetimeHelper.is_zulu_time? value
        record.errors[attribute] << (options[:message] || 'is not in UTC+0 (Zulu Time)')
      end

    end
  end
end
