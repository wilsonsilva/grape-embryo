module Embryo
  # Entry point to our Grape-powered API
  class API < Grape::API
    format :json

    # Mount your API endpoints here
    mount ::Embryo::PeopleAPI

    add_swagger_documentation api_version: 'v1', mount_path: '/documentation'

    route(:any, '*path') { error! 'Not found.', 404 }
  end
end
