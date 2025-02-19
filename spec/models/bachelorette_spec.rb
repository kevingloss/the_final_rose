require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  before :each do
    @b1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season: "Most Dramatic Season Yet!")
    @b2 = Bachelorette.create!(name: "Molly Smith", season_number: 9, season: "Adventure Time!")
    @b3 = Bachelorette.create!(name: "Jennifer Lopez", season_number: 3, season: "Celebrity Edition!")

    @c1 = @b1.contestants.create!(name: "Mark Johnson", age: 50, hometown: "Philadelphia, PA")
    @c2 = @b1.contestants.create!(name: "John Steel", age: 35, hometown: "Denver, CO")
    @c3 = @b1.contestants.create!(name: "Joe Jacobs", age: 40, hometown: "Miami, FL")
    @c4 = @b1.contestants.create!(name: "GG Gravelly", age: 55, hometown: "Houston, TX")
    @c5 = @b2.contestants.create!(name: "Gilbert Gravelly", age: 55, hometown: "Houston, TX")
    @c6 = @b2.contestants.create!(name: "Grant Gravelly", age: 55, hometown: "Denver, CO")
    @c7 = @b2.contestants.create!(name: "Joe Jacobs", age: 40, hometown: "Miami, FL")
  end

  describe 'instance methods' do
    it 'calculates the average age of contestants' do
      expect(@b1.contestant_avg_age).to eq(45)
    end

    it 'displays a unique list of hometowns for the contestants' do
      expect(@b2.contestant_hometowns).to eq(["Houston, TX", "Denver, CO", "Miami, FL"].sort)
    end
  end
end
