require 'rails_helper'

describe Person do
  it 'requires title and last name' do
    person = Person.new(title: 'Mr', last_name: 'Smith')

    expect(person).to be_valid

    person.title = ""

    expect(person).to_not be_valid

    person.title = 'Mr'
    person.last_name = ""

    expect(person).to_not be_valid
  end

  it 'requires first_name and last_name' do
    person = Person.new(first_name: 'Sue', last_name: 'Smith')

    expect(person).to be_valid

    person.first_name = ""

    expect(person).to_not be_valid

    person.first_name = 'Sue'
    person.last_name = ""

    expect(person).to_not be_valid
  end

  it 'knows how many unique locations it is at' do
    person = Person.new(first_name: 'Sue', last_name: 'Smith')
    denver = Location.new(name: 'Denver')
    boulder = Location.new(name: 'Boulder')

    person.assignments << Assignment.new(role: "Janitor", location: denver)
    person.assignments << Assignment.new(role: "Developer", location: denver)
    person.assignments << Assignment.new(role: "Janitor", location: boulder)

    person.save!

    expect(person.unique_locations).to eq 2
  end
end