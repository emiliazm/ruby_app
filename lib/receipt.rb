require_relative 'item'

class Receipt
  attr_reader :items

  def initialize
    @items = []  
  end

  def add(item)
    @items << item
  end

  def print_receipt
    taxes = 0
    total = 0
    @items.each do |item|
      quantity = item[:item].quantity
      taxes += (quantity * (item[:item].tax + item[:item].import_tax)).round(2)
      price = (item[:item].unit_price + item[:item].tax + item[:item].import_tax).round(2)
      total += quantity * price
      puts "#{quantity} #{item[:item].name} #{price * quantity}"
    end
    puts "Sales Taxes: #{taxes.round(2)}"
    puts "Total: #{total}"
  end

end