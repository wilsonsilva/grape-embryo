module Embryo
  module Operations
    module People
      # Finds a person by its ID.
      class FindPerson
        include Dry::Matcher.for(:call, with: ComplexMatcher)
        include ::Operations::Result::Mixin

        # @param [Integer] The ID of the person being found.
        def call(person_id)
          person = Person.find_by_id(person_id)

          if person
            Success(value: person)
          else
            Failure(value: "Could not find person with id #{person_id}", code: :not_found)
          end
        rescue ActiveRecord::ActiveRecordError => error
          Failure(value: error.message, code: :not_retrieved)
        end
      end
    end
  end
end
