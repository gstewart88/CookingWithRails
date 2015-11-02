class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    Recipe.create(recipe_params)
    redirect_to(recipes_path)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to(recipes_path)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id]) #again - the data does not need to be exposed - no @
    recipe.update(recipe_params) #from the private method below - whitelist check
    redirect_to(recipes_path)
  end


  private
  def recipe_params
    # allows these params to be accessed by the methods above
    params.require(:recipe).permit(:title, :instructions, :category_id)
  end

end