module RomFactory
  module Syntax
    module Methods
      def create(*args)
        RomFactory::Builder.create(*args)
      end
    end
  end
end
