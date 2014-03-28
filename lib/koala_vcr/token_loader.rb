class KoalaVCR
  class TokenLoader

    def self.read_token(token_filename)
      File.open(token_filename){ |file| file.readline.chomp }
    end
  end
end
