# Enforces that a DateTime is serialised as zulu time

module DatetimeHelper
  module Serialisers

    def enforce_zulu_time(attribute)
      define_method(attribute) do
        object.send(attribute).utc.iso8601 unless object.send(attribute).nil?
      end
    end

  end
end
