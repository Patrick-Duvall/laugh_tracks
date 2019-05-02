class Comedian < ApplicationRecord
  has_many :specials
  validates_presence_of :name, :age, :city

  def self.average_age
    # require "pry"; binding.pry
    Comedian.average(:age)
  end
end
