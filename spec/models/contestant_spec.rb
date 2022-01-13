require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette }
    it { should have_many(:contestant_outings) }
    it { should have_many(:outings).through(:contestant_outings) }
  end

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

  describe 'instance methods' do
    it 'will return the season number the contestant was on' do
      expect(@c1.season_num).to eq(15)
      expect(@c4.season_num).to eq(9)
    end

    it 'will return the season description the contestant was on' do
      expect(@c1.description).to eq("Most Dramatic Season Yet!")
      expect(@c4.description).to eq("Adventure Time!")
    end
  end
end
