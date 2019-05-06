require "rails_helper"

describe "user sees age-queried comedians" do
  describe "they visit /comedians?age=22" do

    it "displays all comedians aged 22 " do

      comedian_1 = Comedian.create(name: "george", age: 22, city: 'Montreal')
      comedian_2 = Comedian.create(name: "bob", age: 34, city: 'Austin')
      Special.create(name: "Walk Your Way Out", runtime_mins: 70, comedian_id: comedian_1.id)
      Special.create(name: "Walk Your Way Out", runtime_mins: 80, comedian_id: comedian_1.id)

      visit '/comedians'

      fill_in 'age', with: '22'
      click_button 'Filter'
      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.city)
      expect(page).to have_no_content(comedian_2.name)
      expect(page).to have_no_content(comedian_2.age)
      expect(page).to have_no_content(comedian_2.city)


      expect(page).to have_content("Specials Count: 2")
      expect(page).to have_content("Average Runtime: 75.0 mins")


    end
  end

  it "Doesnt error out on non-present ages" do
    visit '/comedians'
    fill_in 'age', with: '99'
    click_button 'Filter'
    save_and_open_page

  end


end
