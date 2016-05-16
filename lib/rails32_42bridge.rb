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
      has_many_without_rails3(*convert_options_to_proc(args))
    end


    def convert_options_to_proc(args)
      if args.last.is_a? Hash
        conditions = args.last.delete(:conditions)
        order = args.last.delete(:order)
        if conditions || order
          args.insert(1, (->{
            scope = nil
            scope = where(conditions) if conditions
            scope = scope ? scope.order(order) : order(order)
          }))
        end
        args
      end
    end

    alias_method_chain :has_many, :rails3

  end


end


include Rails3242bridge::VersionCheck

