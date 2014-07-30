#!/usr/bin/env ruby
#

class Terminal

  attr_accessor :items, :prices

  def initialize
    @items = []
    @prices = {}
  end

  def scan(new_items)
    @items += new_items.split(//)
  end

  def setPrice(item, units, cost)
    @prices[item] = [] if @prices[item].nil?
    @prices[item][units] = cost
  end

  def getPrice(item, units)
    return @prices[item][units]
  end

  def total()
    total_cost = 0
    total_items = {}

    # This is a litle messy . . .
    # Loop through the items
    @items.each do |i|
      # Create a dict to keep track of the number of each item we've seen
      
      total_items[i].nil? ? total_items[i]=1 : total_items[i] += 1
      # If there exists a price for the number of items we have  ( > 1) . . .
      if ! @prices[i][total_items[i]].nil? && ( total_items[i] > 1 )
        # Subtract the cost for the individual items 
        # (we have added one less that the discount amount at this point)
        total_cost -= getPrice(i, 1) * ( total_items[i] - 1)
        # We add that multi-price to the cost
        total_cost += getPrice(i, total_items[i])
        # Set the number of items seen back to zero
        total_items[i] = 0
      else
        total_cost += getPrice(i, 1)
      end
    end

    return total_cost
  end

end

#t = Terminal.new()
#t.setPrice('A', 1, 2)
#t.setPrice('A', 4, 7)
#puts t.getPrice('A', 4)
#puts t.getPrice('A', 1)
#t.scan('A')
#t.scan('A')
#puts t.total
#
#
#
# vim:set ts=2 sw=2 sts=2 expandtab:
