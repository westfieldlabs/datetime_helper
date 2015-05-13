require "datetime_helper/version"

module DatetimeHelper

  ZULU_TIME_PATTERN = /^(\d{4})-([0-1][0-9])-([0-3]\d{1})T([0-2]\d{1}):([0-5]\d{1}):([0-5]\d{1})(\.[0-9]{1,3})?Z$/

  def self.is_zulu_time?(time_string)
    !(time_string =~ ZULU_TIME_PATTERN).nil?
  end

end
