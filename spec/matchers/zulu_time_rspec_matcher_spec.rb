require_relative '../spec_helper'
require 'time'

describe 'be_zulu_time' do
  context 'given a valid zulu time string' do
    let(:valid_time_string) { Time.now.utc.iso8601 }
    it { expect(valid_time_string).to be_zulu_time }
  end

  context 'given an invalid zulu time string' do
    let(:invalid_time_string) { "This is not a zulu time string" }
    it { expect(invalid_time_string).to_not be_zulu_time }
  end
end
