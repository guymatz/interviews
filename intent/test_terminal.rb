#!/usr/bin/env ruby
#

#require 'minitest/spec'
require 'minitest/autorun'
require './terminal'

class TestTerminal < MiniTest::Unit::TestCase

  def setup
    @terminal = Terminal.new
  end

  def test_new_terminal_is_empty
    assert_equal 0, @terminal.items.size
    assert_equal 0, @terminal.prices.size
  end

  def test_scanning_an_item
    @terminal.scan('A')
    assert_equal 1, @terminal.items.size
  end

  def test_scanning_many_items
    many_items = 'ABCBCAAA'
    @terminal.scan(many_items)
    assert_equal many_items.size, @terminal.items.size
  end

  def test_setting_a_price_for_one
    @terminal.setPrice('A',1,2)
  end

  def test_setting_a_price_for_many
    @terminal.setPrice('A',4,7)
  end

  def test_setting_a_price_for_float
    @terminal.setPrice('A',1,0.15)
  end

  def test_setting_and_getting_a_price_for_one
    @terminal.setPrice('A',1,2)
    assert_equal 2, @terminal.getPrice('A', 1)
  end

  def test_setting_and_getting_a_price_for_many
    @terminal.setPrice('A',4,7)
    assert_equal 7, @terminal.getPrice('A', 4)
  end

  def test_setting_and_getting_a_price_for_one_with_float
    @terminal.setPrice('A',1,0.15)
    assert_equal 0.15, @terminal.getPrice('A', 1)
  end

=begin

  def test_total_for_one
    @terminal.setPrice('A',1,2)
    @terminal.scan('A')
    assert_equal 2, @terminal.total()
  end



  def test_total_for_more_than_one
    @terminal.setPrice('A',1,2)
    @terminal.scan('A')
    @terminal.scan('A')
    assert_equal 4, @terminal.total()
  end


  def test_total_for_multi
    @terminal.setPrice('A',4,7)
    @terminal.setPrice('A',1,2)
    @terminal.scan('A')
    @terminal.scan('A')
    @terminal.scan('A')
    @terminal.scan('A')
    assert_equal 7, @terminal.total()
  end
=end

  def __set_price_for_all_items()
  	@terminal.setPrice('A', 1, 2)
    @terminal.setPrice('A', 4, 7)
    @terminal.setPrice('B', 1, 12)
    @terminal.setPrice('C', 1, 1.25)
    @terminal.setPrice('C', 6, 6)
    @terminal.setPrice('D', 1, 0.15)
  end

  def test_case_1
  	__set_price_for_all_items
    @terminal.scan('ABCDABAA')
    assert_equal 32.40, @terminal.total
  end
=begin

  def test_case_2
  	__set_price_for_all_items
    @terminal.scan('CCCCCCC')
    assert_equal 7.25, @terminal.total
  end

  def test_case_3
  	__set_price_for_all_items
    @terminal.scan('ABCD')
    assert_equal 15.40, @terminal.total
  end
=end


end





# vim:set ts=2 sw=2 sts=2 expandtab:
