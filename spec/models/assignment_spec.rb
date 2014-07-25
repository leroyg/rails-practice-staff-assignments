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
end