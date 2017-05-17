require 'test_helper'

class CbListTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CbList::VERSION
  end

  ActiveRecord::Callbacks::CALLBACKS.each do |callback|
    define_method "test_#{callback}_callbacks_order" do 
      kind, name = callback.to_s.split('_').map(&:to_sym)
      confirm_callback_order name, kind
    end
  end

  private

    def confirm_callback_order name, kind
      record = Record.new
      record.run_callbacks name
      all = CbList.name_kind_callbacks_for(Record, name, kind).map(&:raw_filter)
      expected = filter_data all, name, kind
      actual = filter_data record.history, name, kind
      assert_equal expected, actual
    end

    # filter only instance methods defined on Record class
    def filter_data data, name, kind
      regex = /\A#{kind}_#{name}/
      data.select { |item| item =~ regex }.uniq
    end
end
