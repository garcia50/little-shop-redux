describe "As a user" do
  describe "when I go to the merchant index page" do
    it "I can create a new merchant" do
      visit '/merchants/new'

      fill_in "merchant[name]", with: "Soianinoquisi"
      click_button "Create"

      expect(current_path).to eq("/merchants/1")
      expect(page).to have_content("Soianinoquisi")
      expect(Merchant.count).to eq(1)
    end
  end
end
