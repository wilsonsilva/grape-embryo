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
          validation = Schemas::People::Create.call(person_attributes)

          if validation.success?
            person = Person.create(person_attributes)
            Success(value: person)
          else
            error_messages = extract_error_messages(validation)
            Failure(code: :not_created, value: error_messages)
          end
        rescue ActiveRecord::UnknownAttributeError => error
          Failure(code: :not_created, value: error.message)
        end

        private

        def extract_error_messages(validation)
          validation.errors(full: true).values.flatten
        end
      end
    end
  end
end
