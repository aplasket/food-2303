require "rails_helper"

RSpec.describe Food do
  it "exists and has attributes" do
    search = UsdaFacade.new.search_food("sweet potatoes")

    expect(search).to be_a(Hash)
    expect(search).to have_key(:foods)
    expect(search[:foods].count).to eq(10)

    food = search[:foods].last
  
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