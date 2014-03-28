Gem::Specification.new do |gem|
  gem.name         = "koala-vcr"
  gem.homepage     = "https://github.com/victormours/koala-vcr"
  gem.version      = "0.0.1"
  gem.summary      = "KoalaVCR is a small VCR wrapper on a mission to testing with Koala."
  gem.description  = "KoalaVCR reads a Facebook oauth token from a file of your choosing and stubs Koala's oauth tokens inside your calls to VCR."
  gem.licenses     = ['MIT']
  gem.authors      = ["Victor Mours"]
  gem.email        = 'victor.mours@gmail.com'
  gem.files        = `git ls-files`.split("\n")
  gem.require_path = 'lib'

  gem.add_runtime_dependency "koala"
  gem.add_runtime_dependency "vcr"

  gem.add_development_dependency "rspec", "~> 3.0.0.beta2"
  gem.add_development_dependency "pry"
end
