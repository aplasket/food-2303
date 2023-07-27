class UsdaService
  # def initialize(food)
  #   @food = food
  # end

  def food_word_search(food_word)
    get_url("fdc/v1/foods/search?query=#{food_word}&pageSize=10")
    # if using faraday.params in def conn, would need to shorten this to:
        #get_url("fdc/v1/foods/search")
        # AND add a def initialize to this service class to take in the food params
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/", params: { api_key: ENV['USDA_KEY']})

    #alternative option:
    # Faraday.new(url: "https://api.nal.usda.gov/") do |faraday|
    #   faraday.params["api_key"] = ENV["USDA_KEY"]
    #     faraday.params["query"] = "sweet potatoes"
        # faraday.params["pageSize"] = 10
    # end
  end
end