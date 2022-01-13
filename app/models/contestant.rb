class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  def season_num
    bachelorette.season_number
  end

  def description
    bachelorette.season
  end
end
