require "datetime_helper/version"

module DatetimeHelper

  ZULU_TIME_PATTERN = /^(\d{4})-([0-1][0-9])-([0-3]\d{1})T([0-2]\d{1}):([0-5]\d{1}):([0-5]\d{1})(\.[0-9]{1,3})?Z$/

  class << self
    def is_zulu_time?(something)
      return is_zulu_time_string?(something)   if something.is_a? String
      return is_zulu_time_datetime?(something) if something.is_a? DateTime
      return is_zulu_time_time?(something)     if something.is_a? Time
      false
    end

    def is_zulu_time_string?(time_string)
      !(time_string =~ ZULU_TIME_PATTERN).nil?
    end

    def is_zulu_time_datetime?(datetime)
      datetime.zone == "+00:00"
    end

    def is_zulu_time_time?(time)
      time.utc?
    end

  end
end
