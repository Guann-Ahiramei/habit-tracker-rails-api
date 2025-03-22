class Category < ApplicationRecord
  has_and_belongs_to_many :habits
  validates :name, presence: true, uniqueness: true
end
