class Recipe < ActiveRecord::Base
  belongs_to :category

  has_many :quantities
  has_many :ingredients, through: :quantities
  mount_uploader :recipe_image, RecipeImageUploader
end
