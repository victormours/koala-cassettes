require "koala"

class KoalaVCR
  autoload :TokenLoader, "koala_vcr/token_loader"

  def self.load_token(token_filename)
    token = TokenLoader.read_token(token_filename)
    stub_koala_client(token)
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
