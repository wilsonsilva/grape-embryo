module Embryo
  # The rack app where the Grape-powered API will be mounted on
  class App
    def self.instance
      @instance ||= Rack::Builder.new do
        use Rack::Cors do
          allow do
            origins '*'
            resource '*', headers: :any, methods: :get
          end
        end

        run Embryo::App.new
      end.to_app
    end

    delegate :call, to: Embryo::API
  end
end
