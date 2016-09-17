module Embryo
  module Operations
    module People
      # Deletes a Person by its ID.
      class DeletePerson
        include Dry::Matcher.for(:call, with: ComplexMatcher)
        include ::Operations::Result::Mixin

        # @param [Integer] person_id ID of the person.
        def call(person_id)
          people_repo = Repositories::PeopleRepo.new(ROMConnection)
          people_repo.delete(person_id)

          Success(value: true)
        rescue Sequel::Error => error
          Failure(code: :not_destroyed, value: error.message)
        end
      end
    end
  end
end
