# Cardinal
Cardinal is an extension for
[raven-ruby](https://github.com/coderanger/raven-ruby) to augment Rails
stacktraces.

## Usage
1. Add [sentry_cardinal](https://github.com/causes/sentry_cardinal) to your
   sentry instance.
1. Configure raven-ruby to use the cardinal exception class

        require 'raven'
        require 'cardinal'
        Raven.configure do |config|
          config.event_class = Cardinal::Event
        end
