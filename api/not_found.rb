module Embryo
  # Handles 404 errors
  class NotFound < Grape::API
    route :any, '*path' do
      error! 'Not found.', 404
    end
  end
end
