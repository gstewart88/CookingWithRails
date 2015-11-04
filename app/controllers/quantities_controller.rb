class QuantitiesController < ApplicationController
  before_action :set_quantity, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index
    @quantities = Quantity.all
  end

  def show
  end

  def new
    @quantity = Quantity.new
  end

  def edit
  end

  def create
    Quantity.create(quantity_params) 
    redirect_to(quantities_path)
  end

  def update
    @quantity.update(quantity_params) 
    redirect_to(quantities_path)
  end

  def destroy
    @quantity.destroy
    redirect_to(quantities_path)
  end

  private
    def set_quantity
      @quantity = Quantity.find(params[:id])
    end

    def quantity_params
      params.require(:quantity).permit(:ingredient_id, :recipe_id, :quantity)
    end
end
