require "spec_helper"

describe KoalaVCR do

  let(:koala_client) { Koala::Facebook::API.new("original-token") }

  describe ".use_cassette" do
    context "when the cassette does not exist yet" do

      before do
        described_class.token_filename = "spec/fixtures/token"
      end

      it "loads the token from the token file and yields the block to VCR" do
        token = nil
        described_class.use_cassette("cassette", record: :all) do
          token = koala_client.access_token
        end

        expect(token).to eq "stubbed-token"
      end

      it "unstubs the token after exiting" do
        described_class.use_cassette("cassette", record: :all) do
        end

        expect(koala_client.access_token).to eq "original-token"
      end
    end

  end
end
