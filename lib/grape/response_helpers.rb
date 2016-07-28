module Grape
  # Helpers to make HTTP responses easier to build.
  module ResponseHelpers
    # @param [Grape::API] base The API where the helpers are going to be added to.
    def self.included(base)
      base.class_eval do
        helpers do
          # Displays error messages in a standard error format.
          #
          # @example Displaying a single error
          #   errors!('Name is too long (maximum is 70 characters)', status_code: 422)
          #
          # @example Displaying multiple errors
          #   errors!(['Name must be present.', 'Age must be present'], status_code: 422)
          #
          # @param [Array<String>] messages An array of error messages.
          # @param [Integer] status_code The response status code to present.
          def errors!(messages, status_code:)
            errors = Array(messages).map { |message| { detail: message } }
            error!({ errors: errors }, status_code)
          end
        end
      end
    end
  end
end
