# Validates that a supplied value is in fact
# a DateTime, and is in timezone UTC+0
require 'time'
require 'active_model'

module DatetimeHelper
  module Validators
    class ZuluTimeValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        return if value.is_a? DateTime and utc_datetime? value
        return if value.is_a? Time and utc_time? value

        record.errors[attribute] << (options[:message] || 'is not in UTC+0 (Zulu Time)')
      end

      private

      def utc_datetime?(value)
        value.zone == "+00:00"
      end

      def utc_time?(value)
        value.utc?
      end

    end
  end
end
