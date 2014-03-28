koala-vcr
=========

KoalaVCR is a small VCR wrapper on a mission to testing with Koala.

Synopsis
--------

Get a valid Facebook oauth token for the page you use for testing and write it to some file
```bash
  echo "some-valid-facebook_oauth_token" > /tmp/facebook_oauth_token
```

Set the path to this file in your spec helper
```ruby
require 'koal_vcr'

KoalaVCR.token_filename = "/tmp/facebook_oauth_token"
```

Use KoalaVCR just like you would use VCR, and the oauth token in your requests will be the one in your file.
```ruby
describe "My amazing feature" do
  let(:graph) { Koala::Facebook::API.new("this can be an invalid token, i don't care") }

  it "posts stuff to Facebook" do
    KoalaVCR.use_cassette("some_vcr_cassette", record: :all) do
      success = graph.put_connections("me", "feed", :message => "I am writing on my wall!")
    end
    expect(success).to be_truthy
  end
end
```

Bam! Now go check out the cassette. The token used during the request is the one you specified earlier.

Happy testing!

Limitations
-----------

For now, KoalaVCR only implements VCR's `use_cassette`. If you'd like to see an other feature added, feel free to open an issue on Github.

Contributing
------------

Collaborators welcome!

- Fork it
- Send a pull request
- ???
- Profit

Copyright
---------

Copyright (c) 2014 Victor Mours. Released under the terms of the MIT license. See LICENSE for details.
