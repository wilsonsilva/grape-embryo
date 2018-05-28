require 'spec_helper'

describe Embryo::API do
  describe 'GET /documentation' do
    it 'exposes api version' do
      get '/documentation'

      expect_status(200)
      expect_json(
        swagger: '2.0',
        produces: ['application/json']
      )
      expect_json_sizes('paths', 2)
    end
  end
end
