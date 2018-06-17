module Logger
  def log_me
    # Make sure it's being called on every class method
    self.instance_methods(false).each do |m|

    # Make alias method for current instance method
      old = "#{m}_orig".to_sym
      alias_method old, m

    # Redefine current instance method with logging behaviour
      define_method(m) do |*val|
        # Logging
        puts "Starting the method '#{m}'"

        if !val.empty?
          puts "Delivered parameters: #{val}"
        end

        puts "-----------------------------------------------------------"
        # Start "old" method and print return value if any
        return_value = send(old, *val)

        if !return_value.nil?
          puts "returns: #{return_value}"
        end
        puts "-----------------------------------------------------------"
        puts
      end
    end
  end
end
