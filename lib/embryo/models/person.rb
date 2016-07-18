module Embryo
  # A basic human being
  class Person < ActiveRecord::Base
    validates :name, presence: true
    validates :born_at, presence: true

    belongs_to :gender
  end
end
