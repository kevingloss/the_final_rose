class Bachelorette < ApplicationRecord
  has_many :contestants

  def contestant_avg_age
    contestants.average(:age)
  end

  def contestant_hometowns
    contestants.distinct.pluck(:hometown)
  end
end
