require_relative '../lib/receipt'

RSpec.describe Item do
  let(:item) { Item.new(quantity: 1, name:'apple', unit_price:10, imported: true, taxes: false) }
  let(:receipt) { Receipt.new }

  describe 'Add items' do
    it 'should add an Item' do
      receipt.add(item)
      expect(receipt.items).to include(item)
    end
  end

end