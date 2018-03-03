class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredient_names=(ingredient_ids)
    ingr_ids = ingredient_ids.select {|id| !id.empty?}
    ingr_ids.map do |id|
      self.ingredients << Ingredient.find(id)
    end
  end

  def ingredients_names
    self.ingredients.map {|ingredient| ingredient.name}
  end
end
