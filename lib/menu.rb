require_relative '../lib/item'
require_relative '../lib/receipt'

class Menu
  attr_accessor :receipt
  def initialize
    @receipt = Receipt.new
  end

  def main_menu
    puts '
      M E N U
  1) Add item
  2) Get receipt
  3) Exit
  '
  end

  def validate_input_numbers(text, range)
    loop do
      puts text
      input = gets.chomp.to_i
      return input if range.include?(input)
    end
  end

  def validate_input_float(text, range)
    loop do
      puts text
      input = gets.chomp.to_f
      return input if range.include?(input)
    end
  end

  def add_item_menu

    id = rand(1..1000)

    quantity = validate_input_numbers('Quantity: ', (1..100))
    
    category = validate_input_numbers(
    'Enter category: 
    1) Food
    2) Medical items
    3) Books
    4) Other
    ', 1..4)
    case category
    when 1, 2, 3
      taxes = false
    when 4
      taxes = true
    end

    is_imported = validate_input_numbers('Is it imported? 1) yes 2) no', 1..2)
    case is_imported
    when 1
      imported = true
    when 2
      imported = false
    end
    
    print 'Item name: '
    name = gets.chomp.to_s
    
    unit_price = validate_input_float('unit_price: ', (1..100))

    item = Item.new(id: id,  quantity: quantity, name: name, unit_price: unit_price, imported: imported, taxes: taxes)

    receipt.add(item: item)
  end

  def get_receipt_menu
    @receipt.print_receipt
    @receipt = Receipt.new
  end
end