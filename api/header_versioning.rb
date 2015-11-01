module Embryo
  # Shows how to use header versioning
  class HeaderVersioning < Grape::API
    version 'v1', using: :header, vendor: 'embryo', format: :json, strict: true

    desc 'Returns embryo.'
    get do
      { header: 'embryo' }
    end
  end
end
