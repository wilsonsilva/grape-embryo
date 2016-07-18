module Embryo
  # Stores a person's gender
  class Gender < ActiveRecord::Base
    validates :name, presence: true

    has_many :person
  end
end
