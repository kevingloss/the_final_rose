class Bachelorette < ApplicationRecord
  has_many :contestants

  def contestant_avg_age
    contestants.average(:age)
  end
end
