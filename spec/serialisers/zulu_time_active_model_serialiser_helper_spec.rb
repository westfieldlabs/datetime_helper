require_relative '../spec_helper'
require "datetime_helper/active_model_serialiser"

class TestSerialiser < ActiveModel::Serializer
  extend Labs::DatetimeHelper::Serialisers
  attributes :updated_at
  
  enforce_zulu_time :updated_at
end

class TestItemNoTime
  include ActiveModel::SerializerSupport
  attr_reader :updated_at
  def initialize(options = {})
    @updated_at = nil
  end
end

class TestItem < TestItemNoTime
  def initialize(options = {})
    @updated_at = options[:updated_at] || Time.now.utc
  end
end

describe Labs::DatetimeHelper::Serialisers do
  let(:serialiser) { TestSerialiser.new(item) }
  subject          { serialiser.attributes }

  context 'with a UTC time' do
    let(:item)     { TestItem.new }
    it { expect(subject[:updated_at]).to be_zulu_time}
  end

  context 'with a local time' do
    let(:item)     { TestItem.new updated_at:  Time.now.getlocal }
    it { expect(subject[:updated_at]).to be_zulu_time}
  end

  context 'with a nil time' do
    let(:item)     { TestItemNoTime.new }
    it { expect(subject[:updated_at]).to be_nil}
  end

end
