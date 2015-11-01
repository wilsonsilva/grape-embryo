require 'spec_helper'

describe Embryo::API do
  describe 'GET /documentation' do
    it 'exposes api version' do
      get '/documentation'

      expect_status(200)
      expect_json(apiVersion: 'v1')
      expect_json_sizes('apis', 1)
    end
  end
end
