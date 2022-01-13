require 'rails_helper'

RSpec.describe "Contestant show page" do
  before :each do
    @b1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season: "Most Dramatic Season Yet!")
    @b2 = Bachelorette.create!(name: "Molly Smith", season_number: 9, season: "Adventure Time!")
    @b3 = Bachelorette.create!(name: "Jennifer Lopez", season_number: 3, season: "Celebrity Edition!")

    @c1 = @b1.contestants.create!(name: "Mark Johnson", age: 50, hometown: "Philadelphia, PA")
    @c2 = @b1.contestants.create!(name: "John Steel", age: 35, hometown: "Denver, CO")
    @c3 = @b1.contestants.create!(name: "Joe Jacobs", age: 40, hometown: "Miami, FL")
    @c4 = @b2.contestants.create!(name: "Grant Gravelly", age: 55, hometown: "Houston, TX")

    @o1 = @c1.outings.create!(name: "Volcano Ride", location: "Hawaii", date:"07/12/12")
    @o2 = @c1.outings.create!(name: "Cigar Tasting", location: "Cuba", date:"07/08/12")
    @o3 = @c1.outings.create!(name: "Deep Sea Fishing", location: "Gulf of Mexico", date:"07/24/12")
    @o4 = @c2.outings.create!(name: "Ski Trip", location: "Rocky Mountains", date:"07/22/12")
    @o5 = @c2.outings.create!(name: "Cattle Herding", location: "Wyoming", date:"07/29/12")
  end

  it 'links from contestants index' do
    visit bachelorette_contestants_path(@b1)

    click_link "#{@c1.name}"

    expect(current_path).to eq(bachelorette_contestant_path(@b1, @c1))
  end

  it 'has the contestants name, season number, and season description' do
    visit bachelorette_contestant_path(@b1, @c1)

    expect(page).to have_content(@c1.name)
    expect(page).to have_content(@b1.season_number)
    expect(page).to have_content(@b1.season)
    expect(page).to_not have_content(@c2.name)
  end

  it 'has a list of names of the outing the contestant went on' do
    visit bachelorette_contestant_path(@b1, @c1)

    expect(page).to have_content(@o1.name)
    expect(page).to have_content(@o2.name)
    expect(page).to have_content(@o3.name)
    expect(page).to_not have_content(@o4.name)
    expect(page).to_not have_content(@o5.name)
  end
end
