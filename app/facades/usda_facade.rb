class UsdaFacade
  def initialize(food)
    @food = food
  end

  def total_hits
    food_response[:totalHits]
  end

  def foods
    food_response[:foods].map do |food_info|
      Food.new(food_info)
    end
  end

  def food_response
    @_food_response ||= service.food_word_search(@food)
  end

  def service
    @_service ||= UsdaService.new
  end

  # def search_food(params)
  #   results = UsdaService.new.food_word_search(params)

  #   food_array = results[:foods].map do |food_info|
  #     Food.new(food_info)
  #   end

  #   hash = {
  #     foods: food_array,
  #     total_hit: results[:totalHits]
  #   }
  # end
end