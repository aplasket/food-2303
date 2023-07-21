class UsdaFacade
  def search_food(params)
    results = UsdaService.new.food_word_search(params)

    food_array = results[:foods].map do |food_info|
      Food.new(food_info)
    end

    hash = {
      foods: food_array,
      total_hit: results[:totalHits]
    }
  end
end