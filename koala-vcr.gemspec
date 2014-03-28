Gem::Specification.new do |s|
  s.name = "koala-vcr"
  s.version = "0.0.0"
  s.summary     = "Easier Facebook auth token management for testing"
  s.authors     = ["Victor Mours"]
  s.email       = 'victor.mours@gmail.com'
  s.files       = ["lib/koala_vcr.rb"]

  s.add_runtime_dependency "koala"

  s.add_development_dependency "rspec", "~> 3.0.0.beta2"
  s.add_development_dependency "pry"
end
