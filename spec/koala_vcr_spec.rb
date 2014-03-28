require "spec_helper"

describe KoalaVCR do

  describe "configuration" do
    describe ".token_file=" do
      it "sets the location of the token file" do

      end
    end


  end

  describe ".load_token" do
    let(:koala_client) { Koala::Facebook::API.new("dummy-token") }

    it "stubs call to the Koala client with the token in the given file" do
      described_class.load_token("spec/fixtures/token")
      expect(koala_client.access_token).to eq "secret-token"
    end
  end

  describe ".use_cassette" do
    context "when the cassette does not exist yet" do
      it "loads the token from the token file and calls VCR" do

      end

    end

  end

end
