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

if rails4?
  ActiveRecord::Base.class_eval do

    class << self

      def has_many_with_rails3(*args)
        has_many_without_rails3(*convert_options_to_proc(args))
      end

      def has_one_with_rails3(*args)
        has_one_without_rails3(*convert_options_to_proc(args))
      end

      private

      def convert_options_to_proc(args)
        if args.last.is_a? Hash
          conditions = args.last.delete(:conditions)
          order = args.last.delete(:order)
          unique = args.last.delete(:uniq)
          if conditions || order || uniq
            args.insert(1, (->{
              scope = spawn
              scope = where(conditions) if conditions
              scope = scope.uniq if unique
              scope = scope.order(order)
            }))
          end
        end
        args
      end

      alias_method_chain :has_many, :rails3
      alias_method_chain :has_one, :rails3

    end


  end

end


