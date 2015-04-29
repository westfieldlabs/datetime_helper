require_relative '../spec_helper'
require "datetime_helper/active_model"

describe DatetimeHelper::Validators::ZuluTimeValidator do
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

  context "given a String instead of a Time or DateTime" do
    let(:nonsense) { "this makes no sense" }
    it "is not accepted as valid" do
      expect(model.errors[]).to receive('<<')
      validator.validate_each(model, 'updated_at', nonsense)
    end
  end
end
