require_relative '../spec_helper'

describe 'be_zulu_time' do
  context 'given a valid zulu time string' do
    let(:valid_time_string) { Time.now.utc.iso8601 }
    it { expect(valid_time_string).to be_zulu_time }
  end

  context 'given an invalid zulu time string' do
    let(:invalid_time_string) { "This is not a zulu time string" }
    it { expect(invalid_time_string).to_not be_zulu_time }
  end

  context 'given a datetime that is at UTC0' do
    let(:valid_datetime) { DateTime.now.new_offset(0) }
    it { expect(valid_datetime).to be_zulu_time }
  end

  context 'given a datetime that is not at UTC0' do
    let(:invalid_datetime) { DateTime.now.new_offset("+05:30") }
    it { expect(invalid_datetime).to_not be_zulu_time }
  end

  context 'given a time that is at UTC0' do
    let(:valid_time) { Time.now.utc }
    it { expect(valid_time).to be_zulu_time }
  end

  context 'given a time that is not at UTC0' do
    let(:invalid_time) { Time.now.getlocal("+05:30") }
    it { expect(invalid_time).to_not be_zulu_time }
  end
end
