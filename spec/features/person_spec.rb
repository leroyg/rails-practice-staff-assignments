require 'rails_helper'

feature 'Managing people' do
  scenario 'Viewing person details' do
    create_user
    Person.create!(title: 'Mr', first_name: 'Bob', last_name: 'Smith')

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_link 'Mr Bob Smith'

    within('h1') do
      expect(page).to have_content 'Details for Mr Bob Smith'
    end
  end
end