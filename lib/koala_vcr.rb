require "koala"

class KoalaVCR
  autoload :TokenLoader, "koala_vcr/token_loader"
  autoload :TokenStubber, "koala_vcr/token_stubber"

  def self.token_filename=(filename)
    @token_filename = filename
  end

  def self.use_cassette(name, options = {}, &block)
    TokenStubber.stub_token(token)
    VCR.use_cassette(name, options, &block)
    TokenStubber.unstub_token
  end

  private

  def self.token
    TokenLoader.read_token(@token_filename)
  end
end
