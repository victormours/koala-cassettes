require "spec_helper"

describe KoalaVCR::TokenStubber do

  let(:koala_client) { Koala::Facebook::API.new("original-token") }

  describe ".stub_token" do
    it "stubs the koala client's access token" do
      described_class.stub_token("stubbed-token")
      expect(koala_client.access_token).to eq "stubbed-token"
    end
  end

  describe ".unstub_token" do
    it "stops stubbing tokens and resets Koala to its normal state" do
      described_class.stub_token("stubbed_token")
      described_class.unstub_token

      koala_client = Koala::Facebook::API.new("original-token")
      expect(koala_client.access_token).to eq "original-token"
    end
  end

end
