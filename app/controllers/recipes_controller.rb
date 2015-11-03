class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

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
  end

  def destroy
    @recipe.destroy
    redirect_to(recipes_path)
  end

  def edit
  end

  def update
    @recipe.update(recipe_params) 
    redirect_to(recipes_path)
  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    # allows these params to be accessed by the methods above
      params.require(:recipe).permit(:name, :category_id, :instructions, {ingredient_ids: []})
    end

  end