# Rails3::Instantiation

Backports instantiation instrumentation from rails master to rails 3.2.18. More specifically, backports [this commit](https://github.com/rails/rails/commit/2a0d97bc89fc230241453cbbf55621309e1f3ac6).

## Installation

Add this line to your application's Gemfile:

    gem "rails3-instantiation"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails3-instantiation

## Usage

Subscribe to `"instantiation.active_record"` notifications.

You can also `require "rails3/instantiation/log_notification"` to get the notifications logged via `Rails.logger` as `INFO` messages.

## Contributing

1. Fork it ( https://github.com/caius/rails3-instantiation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
