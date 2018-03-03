class RecipesController < ApplicationController

  def show
    set_recipe
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # binding.pry
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit!
  end
end
