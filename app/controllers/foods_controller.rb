class FoodsController < ApplicationController
  def index
    @foods = UsdaFacade.new.search_food(params[:q])
  end
end