# SimpleKM

Very basic (thread-safe) client for the KissMetrics API.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_km'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_km

## Usage

    $ client = SimpleKM::Client.new(api_key: <your API key>, user_identifier: <user identifer>)
    $ client.record("action", some: "data")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
