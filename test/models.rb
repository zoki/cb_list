class Record < ActiveRecord::Base

  # NOTES
  # -----

  # IMPORTANT: 
  # In order for inheritance to work for the callback queues, 
  # you must specify the callbacks before specifying the associations. 
  # Otherwise, you might trigger the loading of a child before
  #  the parent has registered the callbacks and they won't be inherited.

  # Types of callbacks
  #
  # There are four types of callbacks accepted by the callback macros: Method references (symbol), 
  # callback objects, inline methods (using a proc), and inline eval methods (using a string). 
  # Method references and callback objects are the recommended approaches, 
  # inline methods using a proc are sometimes appropriate (such as for creating mix-ins),
  # and inline eval methods are deprecated.

  # non-transactional callbacks - Callbacks are generally run in the order they are defined, 
  # with the exception of callbacks defined as methods on the model, which are called last.
  
  # around callbacks are nested

  # around_save :method_1, :method_2
  # method_1_in
  # - method_2_in
  # -- yield
  # - method_2_out
  # method_1_out
  
  # transactional callbacks - the order is reversed.
 
  ActiveRecord::Callbacks::CALLBACKS.each do |callback|
    1.upto 3 do |i|
      method_sym = "#{callback}_method_#{i}".to_sym
      
      # register callback method
      self.public_send callback, method_sym

      # define callback methods
      if callback =~ /around_/
        define_method method_sym do |&block|
          history << __method__
          block.call
        end
      else
        define_method(method_sym) { history << __method__ }
      end

      # make our methods private
      private method_sym
    end
  end

  def history
    @history ||= []
  end
end