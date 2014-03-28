class KoalaVCR
  class TokenStubber
    def self.stub_token(token)
      Koala::Facebook::API.class_eval <<-RUBY
      def access_token
        "#{token}"
      end
      RUBY
    end

    def self.unstub_token
      Koala::Facebook::API.class_eval <<-RUBY
      attr_accessor :access_token
      RUBY
    end
  end
end
