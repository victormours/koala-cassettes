require "spec_helper"

describe KoalaVCR do

  let(:koala_client) { Koala::Facebook::API.new("dummy-token") }

  describe "configuration" do
    describe ".token_file=" do
      it "sets the location of the token file" do

      end
    end

  end

  describe ".load_token" do
    it "stubs call to the Koala client with the token in the given file" do
      described_class.load_token("spec/fixtures/token")
      expect(koala_client.access_token).to eq "test-token"
    end
  end

  describe ".use_cassette" do
    context "when the cassette does not exist yet" do
      it "loads the token from the token file and yields the block to VCR" do
        token = nil
        described_class.use_cassette("cassette", record: :all) do
          token = koala_client.access_token
        end
        expect(token).to eq "test-token"

      end

    end

  end

  describe ".unstub_token" do
    it "stops stubbing tokens and resets Koala to its normal state" do
      described_class.load_token("spec/fixtures/token")
      described_class.unstub_token
      koala_client = Koala::Facebook::API.new("dummy-token")
      expect(koala_client.access_token).to eq "dummy-token"
    end
  end

end
