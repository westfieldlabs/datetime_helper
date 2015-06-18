module DatetimeHelper
  module Serialisers

    # Enforces that a DateTime is serialised as zulu time format
    # Allow optional aliasing
    def enforce_zulu_time(api_attribute, table_column = api_attribute)
      define_method(api_attribute) do
        object.send(table_column).utc.iso8601 unless object.send(table_column).nil?
      end
    end

    # Enforces that a Date is serialized as iso8601 format
    # Allow optional aliasing
    def enforce_iso8601_date(api_attribute, table_column = api_attribute)
      define_method(api_attribute) do
        object.send(table_column).strftime('%F') unless object.send(table_column).nil?
      end
    end

  end
end
