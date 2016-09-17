module Embryo
  module Operations
    module People
      # Finds people
      class FindPeople
        include Dry::Matcher.for(:call, with: ComplexMatcher)
        include ::Operations::Result::Mixin

        # @param [Params::Sort] sort Sort clauses to order the people.
        def call(sort)
          people_repo = Repositories::PeopleRepo.new(ROMConnection)
          people      = people_repo.all_sorted_by(sort.to_s)
          # people = Person.all.order(sort.to_s)

          Success(value: people)
        rescue ActiveRecord::ActiveRecordError => error
          Failure(value: error.message, code: :not_retrieved)
        end
      end
    end
  end
end
