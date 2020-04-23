class Book < ApplicationRecord
  validates :title, :category, presence: true

  scope :categorized, -> (category) { where category: category }

end
