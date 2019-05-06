class Comedian < ApplicationRecord
  has_many :specials
  validates_presence_of :name, :age, :city

  def self.average_age
    Comedian.average(:age)
  end

  def self.name_sort
    Comedian.order(:name)
  end

  def self.city_sort
    Comedian.order(:city)
  end

  def self.age_sort
    Comedian.order(:age)
  end
end
