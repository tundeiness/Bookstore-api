class Book < ApplicationRecord
  validates :title, :category, presence: true, uniqueness: true

  scope :categorized, -> (category) { where category: category.titleize}
end
