module Embryo
  module Schemas
    module Genders
      Save = Dry::Validation.Schema do
        required(:name).filled(:str?)
      end
    end
  end
end
