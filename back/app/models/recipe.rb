class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :foodstuff, presence: true
  validates :how, presence: true
end
