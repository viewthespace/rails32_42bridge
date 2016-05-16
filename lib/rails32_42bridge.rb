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

ActiveRecord::Base.class_eval do

  class << self

    def has_many_with_rails3(*args)
      has_many_without_rails3(*delete_invalid_rails4_options(args))
    end


    def delete_invalid_rails4_options(args)
      if args.last.is_a? Hash
        args.last.delete(:conditions)
        args.last.delete(:uniq)
        args.last.delete(:order)
      end
      args
    end

    alias_method_chain :has_many, :rails3

  end


end


include Rails3242bridge::VersionCheck

