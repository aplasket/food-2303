class FoodsController < ApplicationController
  def index
    # @foods = UsdaFacade.new.search_food(params[:q])
    @facade = UsdaFacade.new(params[:q])
  end
end