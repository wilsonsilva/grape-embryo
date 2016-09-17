module Embryo
  module Relations
    class People < ROM::Relation[:sql]
      schema do
        attribute :id, Types::Int
        attribute :name, Types::Strict::String
        attribute :born_at, Types::Strict::Time
        attribute :created_at, Types::Strict::Time
        attribute :updated_at, Types::Strict::Time.optional
      end
    end
  end
end
