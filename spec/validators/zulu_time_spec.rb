require_relative '../spec_helper'
require "westfield_datetime_helper/active_model"
require 'time'

describe WestfieldLabs::DatetimeHelper::Validators::ZuluTimeValidator do
  let(:validator) { described_class.new({attributes: [:updated_at]})}
  let(:model)     { double('model') }
  
  before :each do
    allow(model).to receive_message_chain('errors').and_return([])
    allow(model.errors).to receive_message_chain('[]').and_return({})
    allow(model.errors[]).to receive_message_chain('<<')
  end
  
  context "given a UTC+0 Time" do
    let(:valid_time) { Time.now.utc }
    it "is accepted as valid" do
      expect(model.errors[]).to_not receive('<<')
      validator.validate_each(model, 'updated_at', valid_time)
    end
  end

  context "given a local Time" do
    let(:invalid_time) { Time.now.getlocal }
    it "is not accepted as valid" do
      expect(model.errors[]).to receive('<<')
      validator.validate_each(model, 'updated_at', invalid_time)
    end
  end

  context "given a UTC+0 DateTime" do
    let(:valid_time) { DateTime.now.new_offset(0) }
    it "is accepted as valid" do
      expect(model.errors[]).to_not receive('<<')
      validator.validate_each(model, 'updated_at', valid_time)
    end
  end

  context "given a local DateTime" do
    let(:invalid_time) { DateTime.now }
    it "is not accepted as valid" do
      expect(model.errors[]).to receive('<<')
      validator.validate_each(model, 'updated_at', invalid_time)
    end
  end

  context "given a Zulu Time formatted String" do
    let(:zulu_time) { Time.now.utc.iso8601 }
    it "is accepted as valid" do
      expect(model.errors[]).to_not receive('<<')
      validator.validate_each(model, 'updated_at', zulu_time)
    end
  end

  context "given an ISO8601 formatted String that's not at UTC+0" do
    let(:utc_time) { Time.now.iso8601 }
    it "is not accepted as valid" do
      expect(model.errors[]).to receive('<<')
      validator.validate_each(model, 'updated_at', utc_time)
    end
  end

  context "given a String that's just nonsense" do
    let(:nonsense) { "this makes no sense" }
    it "is not accepted as valid" do
      expect(model.errors[]).to receive('<<')
      validator.validate_each(model, 'updated_at', nonsense)
    end
  end
end
