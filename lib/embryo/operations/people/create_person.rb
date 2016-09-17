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
            people_repo = Repositories::PeopleRepo.new(ROMConnection)
            changeset   = people_repo.changeset(person_attributes).map(:add_timestamps)
            person      = people_repo.create(changeset)

            Success(value: person)
          else
            error_messages = extract_error_messages(validation)
            Failure(code: :not_created, value: error_messages)
          end
        rescue ROM::SQL::DatabaseError => error
          Failure(code: :not_created, value: error.message)
        end

        private

        def extract_error_messages(validation)
          validation.message_set.messages.map { |message| "#{message.rule} #{message.text}" }
        end
      end
    end
  end
end
