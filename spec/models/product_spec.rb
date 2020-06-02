require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      category = Category.new(name: "Category")
      product = Product.new(name: "Name", price: 9.99, quantity: 1, category: category)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      category = Category.new(name: "Category")
      product = Product.new(price: 9.99, quantity: 1, category: category)
      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      category = Category.new(name: "Category")
      product = Product.new(name: "Name", quantity: 1, category: category)
      expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      category = Category.new(name: "Category")
      product = Product.new(name: "Name", price: 9.99, category: category)
      expect(product).to_not be_valid
    end

    it 'is not valid without a category' do
      product = Product.new(name: "Name", price: 9.99, quantity: 1)
      expect(product).to_not be_valid
    end
    
  end
end
