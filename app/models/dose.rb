class Dose < ApplicationRecord
  validates :description, presence: true
  validates :cocktail_id, :ingredient_id, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail }
  belongs_to :ingredient
  belongs_to :cocktail
end
