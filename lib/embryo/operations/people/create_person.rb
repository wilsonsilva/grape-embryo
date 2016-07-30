module Embryo
  module Operations
    module People
      # Creates a Person using the provided person attributes.
      class CreatePerson
        include Dry::Matcher.for(:call, with: ComplexMatcher)
        include ::Operations::Result::Mixin

        # @param [Hash] person_attributes Attributes of the person.
        # @option person_attributes [String] :name The name of the person
        # @option person_attributes [String] :born_at Birthday of the person.
        def call(person_attributes)
          person = Person.create(person_attributes)

          if person.persisted?
            Success(value: person)
          else
            Failure(code: :not_created, value: person.errors.full_messages)
          end
        rescue ActiveRecord::UnknownAttributeError => error
          Failure(code: :not_created, value: error.message)
        end
      end
    end
  end
end
