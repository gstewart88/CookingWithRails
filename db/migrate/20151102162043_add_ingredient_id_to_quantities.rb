class AddIngredientIdToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :ingredient_id, :integer
    add_column :quantities, :recipe_id, :integer
    add_column :quantities, :quantity, :string
  end
end
