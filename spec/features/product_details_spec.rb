require 'rails_helper'

RSpec.feature "Visitor clicks on a product's details button", type: :feature, js: true do
  
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

  scenario "They are shown the product's details" do
    visit root_path
    within first('.product') do
      click_on 'Details'
    end

    save_screenshot

    expect(page).to have_css 'article.product-detail', count: 1
  end

end
