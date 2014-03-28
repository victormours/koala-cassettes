Gem::Specification.new do |s|
  s.name        = "koala-vcr"
  s.homepage = "https://github.com/victormours/koala-vcr"
  s.version     = "0.0.0"
  s.summary     = "KoalaVCR is a small VCR wrapper on a mission to testing with Koala."
  s.description = "KoalaVCR reads a Facebook oauth token from a file of your choosing and stubs Koala's oauth tokens inside your calls to VCR."
  s.licenses    = ['MIT']
  s.authors     = ["Victor Mours"]
  s.email       = 'victor.mours@gmail.com'
  s.files       = ["lib/koala_vcr.rb"]

  s.add_runtime_dependency "koala"
  s.add_runtime_dependency "vcr"

  s.add_development_dependency "rspec", "~> 3.0.0.beta2"
  s.add_development_dependency "pry"
end
