module Embryo
  # Entry point to our Grape app
  class API < Grape::API
    format :json

    mount ::Embryo::HeaderVersioning

    add_swagger_documentation api_version: 'v1', mount_path: '/documentation'

    mount ::Embryo::NotFound
  end
end
