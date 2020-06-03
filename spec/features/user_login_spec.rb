require 'rails_helper'

RSpec.feature "Visitor clicks the login button", type: :feature, js: true do

  scenario "They are taken to the login page" do
    visit root_path
    click_on 'Login'

    save_screenshot

    expect(page).to have_css 'h1', text: "Login"
  end
end

RSpec.feature "Visitor clicks the login button", type: :feature, js: true do
  
  before :each do
    @user = User.create! first_name: 'Test', last_name: 'User', email: 'test@test.com', password: 'password', password_confirmation: 'password'
  end

  scenario "They are taken to the login page" do
    visit 'login'

    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_on 'Submit'

    save_screenshot

    expect(page).to have_content 'Logout'
  end
end
