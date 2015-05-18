require_relative '../spec_helper'
require "datetime_helper/active_model_serialiser"

class TestSerialiser < ActiveModel::Serializer
  extend DatetimeHelper::Serialisers
  attributes :updated_at, :enabled_date

  enforce_zulu_time :updated_at
  enforce_iso8601_date :enabled_date
end

class TestItemNoTime
  include ActiveModel::SerializerSupport
  attr_reader :updated_at, :enabled_date
  def initialize(options = {})
    @updated_at = nil
    @enabled_date = nil
  end
end

class TestItem < TestItemNoTime
  def initialize(options = {})
    @updated_at = options[:updated_at] || Time.now.utc
    @enabled_date = options[:enabled_date] || Time.now.to_date
  end
end

describe DatetimeHelper::Serialisers do
  let(:serialiser) { TestSerialiser.new(item) }
  subject          { serialiser.attributes }

  context 'with a UTC time' do
    let(:item)     { TestItem.new }
    it { expect(subject[:updated_at]).to be_zulu_time }
  end

  context 'with a local time' do
    let(:item)     { TestItem.new updated_at: Time.now.getlocal }
    it { expect(subject[:updated_at]).to be_zulu_time }
  end

  context 'with a nil time' do
    let(:item)     { TestItemNoTime.new }
    it { expect(subject[:updated_at]).to be_nil}
  end

  context 'with a date' do
    let(:item)     { TestItem.new }

    it { expect(subject[:enabled_date]).to be_an_iso_formatted_date }
  end

  context 'with a nil date' do
    let(:item)     { TestItemNoTime.new }
    it { expect(subject[:enabled_date]).to be_nil}
  end

end
