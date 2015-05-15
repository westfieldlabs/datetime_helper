module DatetimeHelper
  module Serialisers

    # Enforces that a DateTime is serialised as zulu time format
    def enforce_zulu_time(attribute)
      define_method(attribute) do
        object.send(attribute).utc.iso8601 unless object.send(attribute).nil?
      end
    end

    # Enforces that a Date is serialized as iso8601 format
    def enforce_iso8601_date(attribute)
      define_method(attribute) do
        object.send(attribute).iso8601 unless object.send(attribute).nil?
      end
    end

  end
end
