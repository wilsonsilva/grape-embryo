module Embryo
  module Schemas
    module People
      Create = Dry::Validation.Schema do
        required(:name).filled { str? > max_size?(70) }
        required(:born_at).filled
      end
    end
  end
end
