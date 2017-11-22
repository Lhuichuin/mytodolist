require 'rails_helper'
RSpec.feature "SignIns", type: :feature do
  describe "sign in" do
    before :each do
      User.create(first_name: "user", last_name: "lastname", email: 'user@example.com', password: 'password')
    end

    it "signs me in" do
      visit '/session/new'
      within('form[action= "/session"]') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in as'
    end
  end
end