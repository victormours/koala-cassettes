require "koala"
require "rspec"

class KoalaVCR

  def self.load_token(token_filename)
    token = read_token(token_filename)
    stub_koala_client(token)
  end

  private

  def self.stub_koala_client(token)
    Koala::Facebook::API.class_eval <<-RUBY
      def initialize(token)
        @access_token = "#{token}"
      end
    RUBY
  end

  def self.read_token(token_filename)
    File.open(token_filename){ |file| file.readline.chomp }
  end

  def self.koala_client(token)
    @koala_client ||= Koala::Facebook::API.new(token)
  end
end
