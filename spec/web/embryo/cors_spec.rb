require 'spec_helper'

describe Embryo::API do
  describe 'CORS' do
    it 'supports options' do
      options '/',
              'HTTP_ORIGIN' => 'http://cors.example.com',
              'HTTP_ACCESS_CONTROL_REQUEST_HEADERS' => 'Origin, Accept, Content-Type',
              'HTTP_ACCESS_CONTROL_REQUEST_METHOD' => 'GET'

      expect_status(200)
      expect(headers['Access-Control-Allow-Origin']).to eq('http://cors.example.com')
      expect(headers['Access-Control-Expose-Headers']).to eq('')
    end

    it 'includes Access-Control-Allow-Origin in errors' do
      get '/invalid', 'HTTP_ORIGIN' => 'http://cors.example.com'

      expect_status(404)
      expect(headers['Access-Control-Allow-Origin']).to eq('http://cors.example.com')
    end
  end
end
