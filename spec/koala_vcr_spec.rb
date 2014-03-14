require "spec_helper"
require "koala_vcr"

describe KoalaVCR do
  describe ".load_token" do
    let(:koala_client) { Koala::Facebook::API.new("dummy-token") }

    it "stubs call to the Koala client with the token in the given file" do
      described_class.load_token("spec/fixtures/token")
      expect(koala_client.access_token).to eq "secret-token"
    end

  end

end
