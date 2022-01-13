require 'rails_helper'

RSpec.describe 'Bachelorette Show Page' do
  before :each do
    @b1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season: "Most Dramatic Season Yet!")
    @b2 = Bachelorette.create!(name: "Molly Smith", season_number: 9, season: "Adventure Time!")
    @b3 = Bachelorette.create!(name: "Jennifer Lopez", season_number: 3, season: "Celebrity Edition!")

    @c1 = @b1.contestants.create!(name: "Mark Johnson", age: 50, hometown: "Philadelphia, PA")
    @c2 = @b1.contestants.create!(name: "John Steel", age: 35, hometown: "Denver, CO")
    @c3 = @b1.contestants.create!(name: "Joe Jacobs", age: 40, hometown: "Miami, FL")
    @c4 = @b2.contestants.create!(name: "Grant Gravelly", age: 55, hometown: "Houston, TX")
  end

  it 'has all contestants associated with bachelorette' do
    visit bachelorette_contestants_path(@b1)

    expect(page).to have_content(@b1.name)
    expect(page).to have_content(@c1.name)
    expect(page).to have_content(@c2.name)
    expect(page).to have_content(@c3.name)
    expect(page).to_not have_content(@c4.name)
  end
end
