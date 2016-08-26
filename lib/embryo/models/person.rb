module Embryo
  # A basic human being
  class Person < ActiveRecord::Base
    belongs_to :gender
  end
end
