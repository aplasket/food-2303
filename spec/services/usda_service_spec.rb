require "rails_helper"

RSpec.describe UsdaService do
  describe "establishes a connection with api" do
    it "#food_word_search(food_word)" do
      results = UsdaService.new.food_word_search("sweet potatoes")

      expect(results).to be_a(Hash)
      expect(results).to have_key(:foods)
      expect(results[:foods]).to be_an(Array)
      expect(results[:foods].count).to eq(10)
      expect(results).to have_key(:totalHits)
      expect(results[:totalHits]).to be_an(Integer)
      expect(results[:totalHits]).to eq(55579)

      food = results[:foods].last
      
      expect(food).to have_key(:gtinUpc)
      expect(food[:gtinUpc]).to be_a(String)
      expect(food).to have_key(:description)
      expect(food[:description]).to be_a(String)
      expect(food).to have_key(:brandOwner)
      expect(food[:brandOwner]).to be_a(String)
      expect(food).to have_key(:ingredients)
      expect(food[:ingredients]).to be_a(String)
    end
  end
end