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
      expect(page).to have_css(".food", count: 10)

      within(first(".food")) do
        expect(page).to have_css(".GTIN/UPC_code")
        expect(page).to have_css(".description")
        expect(page).to have_css(".brand_owner")
        expect(page).to have_css(".ingredients")
      end
    end

    xit "displays total number of items returned" do

    end
  end
end