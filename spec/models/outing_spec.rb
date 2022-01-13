require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  before :each do
    @b1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season: "Most Dramatic Season Yet!")
    @b2 = Bachelorette.create!(name: "Molly Smith", season_number: 9, season: "Adventure Time!")
    @b3 = Bachelorette.create!(name: "Jennifer Lopez", season_number: 3, season: "Celebrity Edition!")

    @c1 = @b1.contestants.create!(name: "Mark Johnson", age: 50, hometown: "Philadelphia, PA")
    @c2 = @b1.contestants.create!(name: "John Steel", age: 35, hometown: "Denver, CO")
    @c3 = @b1.contestants.create!(name: "Joe Jacobs", age: 40, hometown: "Miami, FL")
    @c4 = @b2.contestants.create!(name: "Grant Gravelly", age: 55, hometown: "Houston, TX")

    @o1 = Outing.create!(name: "Volcano Ride", location: "Hawaii", date:"07/12/12")
    @o2 = Outing.create!(name: "Cigar Tasting", location: "Cuba", date:"07/08/12")
    @o3 = Outing.create!(name: "Deep Sea Fishing", location: "Gulf of Mexico", date:"07/24/12")
    @o4 = Outing.create!(name: "Ski Trip", location: "Rocky Mountains", date:"07/22/12")
    @o5 = Outing.create!(name: "Cattle Herding", location: "Wyoming", date:"07/29/12")

    @co1 = ContestantOuting.create!(contestant: @c1, outing: @o1)
    @co2 = ContestantOuting.create!(contestant: @c2, outing: @o1)
    @co3 = ContestantOuting.create!(contestant: @c3, outing: @o1)
    @co4 = ContestantOuting.create!(contestant: @c1, outing: @o2)
    @co5 = ContestantOuting.create!(contestant: @c2, outing: @o2)
  end

  describe 'instance methods' do
    it 'can count the number of contestants on an outing' do
      expect(@o1.num_contestants).to eq(3)
    end
  end
end
