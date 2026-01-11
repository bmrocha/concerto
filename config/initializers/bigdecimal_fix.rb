# Fix for BigDecimal.new removal in Ruby 2.6+
# This monkey patch adds back the .new method for compatibility

if defined?(BigDecimal)
  class BigDecimal
    class << self
      alias_method :original_new, :new
      
      def new(*args, **kwargs)
        if kwargs.empty?
          BigDecimal(*args)
        else
          BigDecimal(*args, **kwargs)
        end
      end
    end
  end
end