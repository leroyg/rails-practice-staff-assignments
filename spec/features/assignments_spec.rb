require 'rails_helper'

feature "Assignments" do

  before do
    @user = create_user
  end

  scenario 'Assigning person to a location' do
    create_person(title: 'Mr', first_name: 'Bob', last_name: 'Smith')
    Location.create!(name: 'Boulder')

    visit root_path
    log_in_user(@user)

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

  scenario 'Editing an assignment' do
    person = create_person
    location = Location.create!(name: 'Boulder')
    Location.create!(name: 'Denver')
    person.assignments.create!(location: location, role: "Developer")

    visit root_path
    log_in_user(@user)

    visit person_path(person)

    within('.assignments') do
      expect(page).to have_content 'Boulder'
      expect(page).to have_content 'Developer'
      click_link 'edit'
    end

    select 'Denver', from: 'assignment[location_id]'
    fill_in 'assignment[role]', with: 'Janitor'
    click_button 'Assign'

    within('.assignments') do
      expect(page).to have_no_content 'Boulder'
      expect(page).to have_no_content 'Developer'
      expect(page).to have_content 'Denver'
      expect(page).to have_content 'Janitor'
    end
  end

  scenario 'Deleting an assignment' do
    person = create_person
    location = Location.create!(name: 'Boulder')
    Location.create!(name: 'Denver')
    person.assignments.create!(location: location, role: "Developer")

    visit root_path
    log_in_user(@user)

    visit person_path(person)

    within('.assignments') do
      expect(page).to have_content 'Boulder'
      expect(page).to have_content 'Developer'
      click_link 'delete'
    end

    within('.assignments') do
      expect(page).to have_no_content 'Boulder'
      expect(page).to have_no_content 'Developer'
    end
  end
end