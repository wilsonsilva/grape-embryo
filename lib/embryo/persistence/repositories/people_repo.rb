require 'rom-repository'

module Embryo
  module Repositories
    class PeopleRepo < ROM::Repository[:people]
      commands :create, update: :by_pk, delete: :by_pk

      # def query(conditions)
      #   people.where(conditions).as(Person).to_a
      # end

      # def all
      #   people.as(Person).to_a
      # end

      # def [](id)
      #   people.by_id(id).as(Person).one!
      # end

      # def by_id(id)
      #   people.fetch(id)
      # end

      def all_sorted_by(sort)
        people.order(sort).to_a
      end

      def count
        people.count
      end

      def first
        people.first
      end
    end
  end
end
