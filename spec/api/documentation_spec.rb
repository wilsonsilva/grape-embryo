require 'spec_helper'

describe Embryo::API do
  describe 'GET /documentation' do
    it 'exposes api version' do
      get '/documentation'

      expect_status(200)
      expect_json(apiVersion: 'v1',
                  swaggerVersion: '1.2',
                  produces: ['application/json'])
      expect_json_sizes('apis', 2)
    end
  end
end
