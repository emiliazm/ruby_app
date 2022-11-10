require_relative '../lib/item'

RSpec.describe Item do
  let(:item) { Item.new(quantity: 1, name:'apple', unit_price:10, imported: true, taxes: false) }
  
  describe 'An item' do
    it 'should have a quantity' do
      expect(item.quantity).to eq(1)
    end

    it 'should have a name' do
      expect(item.name).to eq('apple')
    end

    it 'should have a unit_price' do
      expect(item).to have_attributes(unit_price: 10.0)
    end

    it 'should have imorted true' do
      expect(item).to have_attributes(imported: true)
    end

    it 'should have a taxes false' do
      expect(item).to have_attributes(taxes: false)
    end

    
  end

  describe 'An item with taxes:false and imported:true' do
    it 'should have a tax = 0' do
      expect(item.tax).to eq(0)
    end

    it 'should have a import_tax = 5%' do
      p item
      expect(item.import_tax).to eq(0.50)
    end
  end

end