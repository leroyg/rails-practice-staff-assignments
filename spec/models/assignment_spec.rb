require 'rails_helper'

describe Assignment do

  let(:location) { Location.new(name: "Boulder") }

  let(:assignment) { Assignment.new(role: "Janitor", location: location) }

  it 'requires a role' do
    expect(assignment).to be_valid

    assignment.role = ""
    expect(assignment).to_not be_valid
  end

  it 'requires a location' do
    expect(assignment).to be_valid

    assignment.location = nil
    expect(assignment).to_not be_valid
  end

  it 'does not allow a duplicate roles for a location' do
    Assignment.create!(role: "Janitor", location: location)

    invalid_assignment = Assignment.new(role: "Janitor", location: location)

    expect(invalid_assignment).to_not be_valid

    valid_assignment = Assignment.new(role: "Developer", location: location)
    expect(valid_assignment).to be_valid

    valid_assignment = Assignment.new(role: "Janitor", location: Location.new(name: 'Denver'))

    expect(valid_assignment).to be_valid
  end
end