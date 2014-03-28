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


  describe ".stub_token" do
    context "without a filename" do
      it "reads the token from the token filename specified earlier" do
        described_class.token_filename = "spec/fixtures/token"
        described_class.stub_token
        expect(koala_client.access_token).to eq "stubbed-token"
      end
    end

    it "stubs the koala client's access token" do
      described_class.stub_token("spec/fixtures/token")
      expect(koala_client.access_token).to eq "stubbed-token"
    end
  end

  describe ".unstub_token" do
    it "stops stubbing tokens and resets Koala to its normal state" do
      described_class.stub_token("spec/fixtures/token")
      described_class.unstub_token
      koala_client = Koala::Facebook::API.new("original-token")
      expect(koala_client.access_token).to eq "original-token"
    end
  end

end
