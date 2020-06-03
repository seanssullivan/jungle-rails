require 'rails_helper'

RSpec.feature "Visitor clicks the add to cart button", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the number of items in their cart increase by 1" do
    visit root_path
    within first('.product') do
      click_on 'Add'
    end

    save_screenshot

    expect(page).to have_content "My Cart (1)"
  end

end
