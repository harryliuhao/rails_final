class RecipesController < ApplicationController
  def index
  	@search_term=params[:search] ||'swiss'
  	@recipes=Recipe.for(@search_term)
  end
end
