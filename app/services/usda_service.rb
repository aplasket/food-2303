class UsdaService
  def food_word_search(food_word)
    get_url("fdc/v1/foods/search?query=#{food_word}&pageSize=10")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/", params: { api_key: ENV['USDA_KEY']})
  end
end