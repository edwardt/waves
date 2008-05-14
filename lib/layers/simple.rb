module Waves
  module Layers
    module Simple
      def self.included( app )

        def app.config ; Waves.config ; end
        def app.configurations ; self::Configurations ; end
        
        app.instance_eval do

          include AutoCode
          
          auto_create_module( :Configurations ) do
            include AutoCode
            auto_create_class true, Waves::Configurations::Default
            auto_create_module( :Mapping ) { extend Waves::Mapping }
            auto_load true, :directories => [:configurations]
          end

          include Waves::Layers::SimpleErrors

        end
      end
    end
  end
end
      