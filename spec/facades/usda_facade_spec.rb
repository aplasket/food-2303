require "rails_helper"

RSpec.describe UsdaFacade do
  describe "#search_food(params)" do
    it "can find a food by search word and make food objects" do
      results = UsdaFacade.new.search_food("sweet potatoes")

      expect(results).to be_a(Hash)
      expect(results).to have_key(:foods)
      expect(results[:foods]).to be_an(Array)
      expect(results[:foods].count).to eq(10)
      expect(results).to have_key(:total_hit)
      expect(results[:total_hit]).to be_an(Integer)
      expect(results[:total_hit]).to eq(55579)

      food = results[:foods].last

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
end