require 'rails'

module Rails3242bridge

  module VersionCheck

    def rails4?
      Rails::VERSION::MAJOR == 4
    end

    def rails3?
      !rails4?
    end

  end

end


include Rails3242bridge::VersionCheck

