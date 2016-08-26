module Embryo
  module Schemas
    module People
      Update = Dry::Validation.Schema do
        required(:name).filled { str? > max_size?(70) }
        optional(:born_at).maybe
      end
    end
  end
end
