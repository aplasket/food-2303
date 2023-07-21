require "rails_helper"

RSpec.describe "/foods", type: :feature do
  describe "as a user" do
    it "on root path, when search for ingredient it redirects to food index page" do
      visit root_path

      fill_in :q, with: "sweet potatoes"
      click_on "Search"

      expect(current_path).to eq(foods_path)
    end

    it "displays a list of 10 foods that contain the ingredient, with 4 attributes" do
      visit root_path

      fill_in :q, with: "sweet potatoes"
      click_on "Search"

      expect(current_path).to eq(foods_path)
      expect(page).to have_content("GTIN/UPC:", count: 10)

      within("#food-638882125773") do
        expect(page).to have_content("GTIN/UPC: 638882125773")
        expect(page).to have_content("Description: SWEET POTATOES")
        expect(page).to have_content("Brand Owner: Stahlbush Island Farms, Inc.")
        expect(page).to have_content("Ingredients: SWEET POTATOES.")
      end
    end

    it "displays total number of items returned" do
      visit root_path

      fill_in :q, with: "sweet potatoes"
      click_on "Search"

      expect(current_path).to eq(foods_path)
      expect(page).to have_content("Number of results matching search: 55579")
    end
  end
end