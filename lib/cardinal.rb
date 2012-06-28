require 'raven/event'
require 'raven/interfaces/stack_trace'


module Cardinal
  class Event < Raven::Event
    def stack_trace_interface
      :cardinal_stacktrace
    end

    def parse_backtrace_line(line, frame)
      frame = super
      frame.context_type = if Rails.backtrace_cleaner.clean([line]).empty?
                             'framework'
                           else
                             'application'
                           end
      return frame
    end
  end

  class StacktraceInterface < Raven::StacktraceInterface
    name 'sentry_cardinal.interfaces.Stacktrace'

    def frame(attributes=nil, &block)
      Frame.new(attributes, &block)
    end

    class Frame < Raven::StacktraceInterface::Frame
      property :context_type, :default => 'framework'
    end
  end

  Raven.register_interface :cardinal_stacktrace => StacktraceInterface
end
