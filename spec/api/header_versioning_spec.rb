require 'spec_helper'

describe Embryo::API do
  describe 'versioning' do
    it 'vendored header' do
      get '/', 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

      expect_status(200)
      expect_json(header: 'embryo')
    end

    it 'invalid version' do
      get '/', 'HTTP_ACCEPT' => 'application/vnd.embryo-v2+json'

      expect_status(404)
    end
  end
end
