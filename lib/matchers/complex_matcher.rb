require 'dry-matcher'

# Match `success? == true` for success
success_case = Dry::Matcher::Case.new(
  match:   -> (result) { result.respond_to?(:success?) && result.success? },
  resolve: -> (result) { result.value }
)

# Match `failure? == true` for failure
failure_case = Dry::Matcher::Case.new(
  match:   lambda do |result, *pattern|
    result.respond_to?(:failure?) && result.failure? && (pattern.any? ? pattern.include?(result.code) : true)
  end,
  resolve: -> (result) { result.value }
)

# Build the matcher
ComplexMatcher = Dry::Matcher.new(success: success_case, failure: failure_case)
