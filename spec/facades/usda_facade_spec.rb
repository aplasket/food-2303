require "rails_helper"

RSpec.describe UsdaFacade do
  describe "#foods" do
    it "can find a food by search word and make food objects" do
      results = UsdaFacade.new("sweet potatoes").foods

      food = results.last

      expect(food).to be_a(Food)
      expect(food.brand_owner).to be_a(String)
      expect(food.brand_owner).to eq("Stahlbush Island Farms, Inc.")
      expect(food.description).to be_a(String)
      expect(food.description).to eq("SWEET POTATOES")
      expect(food.gtin_upc).to be_a(String)
      expect(food.gtin_upc).to eq("638882125773")
      expect(food.ingredients).to be_a(String)
      expect(food.ingredients).to eq("SWEET POTATOES.")
    end
  end

  describe "#total_hits" do
    it "can return the total number of response for the key word" do
      results = UsdaFacade.new("sweet potatoes").total_hits

      expect(results).to eq(55579)
    end
  end
end