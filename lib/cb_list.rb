require "cb_list/version"
require 'cb_list/railtie' if defined?(Rails)
require 'colorize'


module CbList
  def self.show klass
    klass = klass.constantize if klass.is_a? String
    names = ActiveRecord::Callbacks::CALLBACKS.map { |cb| cb.to_s.split('_').last }.uniq
    delimiter_1 = "=" * 20
    delimiter_2 = "-" * 20
    
    print_out "#{klass.name} Active Record Callbacks".red

    names.each.with_index(1) do |name, name_index|
      print_out
      print_out "#{name_index}. #{name.upcase}".light_blue
      print_out delimiter_1.light_blue

      ActiveSupport::Callbacks::CALLBACK_FILTER_TYPES.each do |kind|
        kind_name = "#{kind}_#{name}".to_sym
        kind_callbacks = name_kind_callbacks_for(klass, name, kind)
      
        if ActiveRecord::Callbacks::CALLBACKS.include?(kind_name)
          print_out
          print_out "#{kind_name}".blue
          print_out delimiter_2.blue
          kind_callbacks.each.with_index(1) do |callback, callback_index|
            print_out "#{callback_index}. #{callback.raw_filter}".green
          end.presence || print_out("Empty")
        end
      end
    end
  end

  def self.print_out str=nil
    prefix = "# "
    result = str ? prefix + str : prefix
    puts result
  end

  def self.name_callbacks_for klass, name
    klass.public_send("_#{name}_callbacks")
  end

  def self.name_kind_callbacks_for klass, name, kind
    name_callbacks = name_callbacks_for(klass, name).select { |name_callback| name_callback.kind.eql?(kind) }
    name_callbacks.reverse! if kind == :after
    name_callbacks
  end
end