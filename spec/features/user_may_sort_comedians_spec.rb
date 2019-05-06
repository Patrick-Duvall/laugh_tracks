
require "rails_helper"

describe "user may see sorted comedians" do
  describe "they visit /comedians?sort=name" do
    it "displays all comedians sorted by name " do
      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      comedian_2 = Comedian.create(name: "xena", age: 39, city: 'Austin')
      visit '/comedians?sort=name'
      expect(/bob(.|\n)*george(.|\n)*xena/).to match(page.body)
    end
  end

  describe "they visit /comedians?sort=city" do
    it "displays all comedians sorted by city " do
      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Detroit')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      comedian_3 = Comedian.create(name: "xena", age: 39, city: 'Montreal')
      visit '/comedians?sort=city'

      expect(/City: Austin(.|\n)*City: Detroit(.|\n)*City: Montreal/).to match(page.body)
    end
  end
  describe "they visit /comedians?sort=age" do
    it "displays all comedians sorted by age " do
      comedian_1 = Comedian.create(name: "george", age: 104, city: 'Detroit')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      comedian_3 = Comedian.create(name: "xena", age: 39, city: 'Montreal')
      visit '/comedians?sort=age'
      expect(/Age: 34(.|\n)*Age: 39(.|\n)*Age: 104/).to match(page.body)
    end
  end


end
