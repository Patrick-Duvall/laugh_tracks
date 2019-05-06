require "rails_helper"

describe Comedian do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many :specials }

  end

  describe ".average_age" do
    it "returns the average age of comedians" do
      comedian_1 = Comedian.create(name: "george", age: 20, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 60, city: 'Austin')
      expect(Comedian.average_age).to eq(40)
    end
  end

  describe ".name_sort" do
    it "returns comedians sorted by name" do
      comedian_1 = Comedian.create(name: "george", age: 20, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 60, city: 'Austin')
      expect(Comedian.name_sort).to eq([comedian_2, comedian_1])
    end
  end

  describe ".city_sort" do
    it "returns comedians sorted by city" do
      comedian_1 = Comedian.create(name: "george", age: 20, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 60, city: 'Austin')
      comedian_3 = Comedian.create(name: "xena", age: 60, city: 'Denver')
      expect(Comedian.city_sort).to eq([comedian_2, comedian_3, comedian_1])
    end
  end

  describe ".age_sort" do
    it "returns comedians sorted by age" do
      comedian_1 = Comedian.create(name: "george", age: 20, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 60, city: 'Austin')
      comedian_3 = Comedian.create(name: "jane", age: 55, city: 'Austin')
      expect(Comedian.age_sort).to eq([comedian_1, comedian_3, comedian_2])
    end
  end

end
