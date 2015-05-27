require_relative '../spec_helper'

describe 'iso_formatted' do
  describe 'be_an_iso_formatted_time' do
    context 'given a valid time string' do
      let(:valid_time_string) { "11:00" }
      it { expect(valid_time_string).to be_an_iso_formatted_time }
    end

    context 'given an invalid time string' do
      let(:invalid_time_string) { "This is not a time string" }
      it { expect(invalid_time_string).to_not be_an_iso_formatted_time }
    end

    context 'given a valid time embedded in a string' do
      let(:embedded_time_string) { Time.now.iso8601 }
      it { expect(embedded_time_string).to_not be_an_iso_formatted_time }
    end
  end

  describe 'be_an_iso_formatted_date' do
    context 'given a valid date string' do
      let(:valid_date_string) { "2015-11-30" }
      it { expect(valid_date_string).to be_an_iso_formatted_date }
    end

    context 'given an invalid date string' do
      let(:invalid_date_string) { "This is not a date string" }
      it { expect(invalid_date_string).to_not be_an_iso_formatted_date }
    end

    context 'given an valid date embedded in a string' do
      let(:embedded_date_string) { Time.now.iso8601 }
      it { expect(embedded_date_string).to_not be_an_iso_formatted_date }
    end
  end
end
