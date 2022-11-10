class Item
  attr_reader :quantity, :unit_price, :name, :imported, :taxes

  def initialize( id: nil, quantity:, name:, unit_price:, imported:, taxes:)
    @id = id || rand(1..1000)
    @quantity = quantity
    @name = name
    @unit_price = unit_price.to_f
    @imported = imported
    @taxes = taxes
  end

  def tax
    return (@unit_price * 0.10).round(2) if @taxes == true
    0
  end

  def import_tax
    return round_to(@unit_price * 5, 5) / 100 if @imported == true
    0
  end

  def round_to(n , m)
    return n if (n % m).zero?
    m + n - (n % m)
  end

end