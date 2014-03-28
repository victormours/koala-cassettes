require "spec_helper"

describe KoalaVCR::TokenLoader do

  describe ".read_token" do

    it "returns the token string contained in the file" do
      token = described_class.read_token("spec/fixtures/token")
      expect(token).to eq "stubbed-token"
    end
  end
end
