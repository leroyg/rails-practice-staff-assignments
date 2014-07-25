require 'rails_helper'

feature "Assignments" do
  scenario 'Assigning person to a location' do
    create_user
    Person.create!(title: 'Mr', first_name: 'Bob', last_name: 'Smith')
    Location.create!(name: 'Boulder')

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_link 'Mr Bob Smith'

    click_link '+ Add Location'

    select 'Boulder', from: 'assignment[location_id]'
    fill_in 'assignment[role]', with: 'Developer'
    click_button 'Assign'

    within('.assignments') do
      expect(page).to have_content 'Boulder'
      expect(page).to have_content 'Developer'
    end
  end
end