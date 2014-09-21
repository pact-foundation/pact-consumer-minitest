# Pact::Consumer::Minitest

Provides Pact Consumer support for Minitest.

## Installation

Add this line to your application's Gemfile:

    gem 'pact-consumer-minitest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pact-consumer-minitest

## Usage

See the README for the [pact](https://github.com/realestate-com-au/pact) gem for full instructions on how to use Pact.

To use Pact with Minitest, instead of requiring `"pact/consumer/rspec"`, require `"pact/consumer/minitest"` and include `Pact::Consumer::Minitest` in your spec or unit test.

See an example [here](/example/zoo-app/spec/service_providers/animal_service_client_spec.rb).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pact-consumer-minitest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
