require_relative 'spec_helper'

describe DatetimeHelper do
  describe '#is_zulu_time?' do
    context "given a valid Zulu Time string" do
      let(:valid_string) { Time.now.utc.iso8601 }
      it { expect{ Time.parse(valid_string)}.to_not raise_error }
      it { expect(DatetimeHelper.is_zulu_time?(valid_string)).to eq true }
    end

    context "given a valid ISO 8601 string that's not Zulu Time" do
      let(:invalid_string) { Time.now.iso8601 }
      it { expect{ Time.parse(invalid_string)}.to_not raise_error }
      it { expect(DatetimeHelper.is_zulu_time?(invalid_string)).to eq false }
    end

    context "given nonsense" do
      let(:nonsense) { "not really a zulu time string" }
      it { expect{ Time.parse(nonsense)}.to raise_error }
      it { expect(DatetimeHelper.is_zulu_time?(nonsense)).to eq false }
    end
  end
end
