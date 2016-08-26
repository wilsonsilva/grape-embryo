module Embryo
  # Stores a person's gender
  class Gender < ActiveRecord::Base
    has_many :person
  end
end
