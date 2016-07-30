module Embryo
  module Operations
    module People
      # Updates a Person using the provided person attributes.
      class UpdatePerson
        include Dry::Matcher.for(:call, with: ComplexMatcher)
        include ::Operations::Result::Mixin

        # @param [Integer] person_id ID of the person being updated.
        # @param [Hash] person_attributes Attributes of the person.
        # @option person_attributes [String] :name The name of the person
        # @option person_attributes [String] :born_at Birthday of the person.
        def call(person_id, person_attributes)
          person = Person.find_by_id(person_id)

          if person
            update_person(person, person_attributes)
          else
            Failure(value: "Could not find person with id #{person_id}", code: :not_found)
          end
        rescue ActiveRecord::UnknownAttributeError => error
          Failure(value: error.message, code: :not_updated)
        end

        private

        def update_person(person, person_attributes)
          person.update(person_attributes)

          if person.valid?
            Success(value: person)
          else
            Failure(value: person.errors.full_messages, code: :not_updated)
          end
        end
      end
    end
  end
end
