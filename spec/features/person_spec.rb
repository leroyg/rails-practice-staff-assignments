require 'rails_helper'

feature 'Managing people' do
  scenario 'Editing person details' do
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

    click_link 'Edit details'

    fill_in 'person[title]', with: 'Ms'
    fill_in 'person[first_name]', with: 'Sue'
    fill_in 'person[last_name]', with: 'Jones'
    click_button 'Update Person'

    within('h1') do
      expect(page).to have_no_content 'Details for Mr Bob Smith'
      expect(page).to have_content 'Details for Ms Sue Jones'
    end
  end
end