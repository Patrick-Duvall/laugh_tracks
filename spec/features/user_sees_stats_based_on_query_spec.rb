#
# As a visitor
# When I visit `/comedians?age=34`
# Then I see a list of all comedians with an age of 34
# Just like a previous User Story, BUT all other statistics
# information in the 'Statistics' area of the page should be limited
# to reflect only the information about the comedians listed on
# the page.

require "rails_helper"

describe "user sees age-queried comedians" do
  describe "they visit /comedians?age=22" do
    it "displays all comedians aged 22 " do

      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')

      visit '/comedians?age=22'

      within("div#statistics") do

        expect(page).to have_content("Average Age: 22")
        expect(page).to have_content(comedian_1.city)
        expect(page).to have_no_content(comedian_2.city)

      end
    end
  end
end
