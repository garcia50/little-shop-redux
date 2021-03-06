describe "As a user" do
  describe "when I vist the category index page" do
    it "I can see all categories" do
      Category.create(name: "Doyouwantmetotypeforyou")
      Category.create(name: "Seriouslydoyouwantmetotypeforyou")
      Category.create(name: "Justgetoutoftheway")
      Category.create(name: "DoYoUWaNtMEtoTyPeFORyOu")

      visit "/categories"

      expect(page).to have_content("Doyouwantmetotypeforyou")
      expect(page).to have_content("Seriouslydoyouwantmetotypeforyou")
      expect(page).to have_content("Justgetoutoftheway")
      expect(page).to have_content("DoYoUWaNtMEtoTyPeFORyOu")
    end

    it "I can click on create a category" do
      Category.create(name: "Doyouwantmetotypeforyou")

      visit '/categories'

      click_on "Create New Category"

      expect(current_path).to eq("/categories/new")
    end

    it "I can click on edit a category" do
      Category.create(name: "DoYoUWaNtMEtoTyPeFORyOu")

      visit '/categories'

      click_on "Edit"

      expect(current_path).to eq("/categories/1/edit")
    end

    it "I can click on delete a category" do
      Category.create(name: "DoYoUWaNtMEtoTyPeFORyOu")
      Category.create(name: "Doyouwantmetotypeforyou")

      visit '/categories'

      first(:button, "Delete").click

      expect(current_path).to eq("/categories")
    end

    it "I see one category" do
      category = Category.create(name: "Doyouwantmetotypeforyou")

      visit "/categories"

      click_on "Doyouwantmetotypeforyou"

      visit "/categories/#{category.id}"

      expect(page).to have_content("Doyouwantmetotypeforyou")
    end

  end
end
