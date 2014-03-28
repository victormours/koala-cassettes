require "koala"

class KoalaVCR
  autoload :TokenLoader, "koala_vcr/token_loader"

  def self.token_filename=(filename)
    @token_filename = filename
  end

  def self.use_cassette(name, options = {}, &block)
    stub_token
    VCR.use_cassette(name, options, &block)
    unstub_token
  end

  def self.stub_token(filename = nil)
    token = TokenLoader.read_token(filename || @token_filename)
    stub_koala_client(token)
  end

  def self.unstub_token
    Koala::Facebook::API.class_eval <<-RUBY
      attr_accessor :access_token
    RUBY
  end


  private

  def self.stub_koala_client(token)
    Koala::Facebook::API.class_eval <<-RUBY
      def access_token
        "#{token}"
      end
    RUBY
  end

  def self.koala_client(token)
    @koala_client ||= Koala::Facebook::API.new(token)
  end
end
