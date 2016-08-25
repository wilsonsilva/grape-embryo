module RSpec
  # Temporary matcher to help test the error messages of dry-validation while the guys
  # from dry-rb separate the error messages from the hints.
  module HaveErrorMessageMatcher
    RSpec::Matchers.define :have_error_message do |expected|
      match do |validation|
        messages = validation.message_set.messages.map { |message| "#{message.rule} #{message.text}" }
        messages.include?(expected)
      end

      failure_message do |actual|
        "expected #{actual} to have the error message \"#{expected}\""
      end

      failure_message_when_negated do |actual|
        "expected #{actual} not to have error the message \"#{expected}\""
      end

      description do
        "has the error message \"#{expected}\""
      end
    end
  end
end
