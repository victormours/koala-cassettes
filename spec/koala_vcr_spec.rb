require "spec_helper"

describe KoalaVCR do

  let(:koala_client) { Koala::Facebook::API.new("original-token") }

  describe ".use_cassette" do
    context "when the cassette does not exist yet" do

      before do
        described_class.token_filename = "spec/fixtures/token"
      end

      it "loads the token when yielding to VCR" do
        token = nil
        described_class.use_cassette("cassette", record: :all) do
          token = koala_client.access_token
        end

        expect(token).to eq "stubbed-token"
      end

      it "calls VCR with the given arguments" do
        expect(VCR).to receive(:use_cassette)
          .with("cassette", record: :all, )
        described_class.use_cassette("cassette", record: :all) {}
      end

      it "unstubs the token after exiting" do
        described_class.use_cassette("cassette", record: :all) {}

        expect(koala_client.access_token).to eq "original-token"
      end
    end

  end
end
