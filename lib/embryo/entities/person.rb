module Embryo
  class Person < Dry::Types::Struct
    attribute :id, Types::Int
    attribute :name, Types::Coercible::String
    attribute :born_at, Types::DateTime
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime
  end
end
