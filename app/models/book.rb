class Book < ApplicationRecord
  validates :title, :category, presence: true

  # scope :categorized, -> (category) { where category: category }

  # Step 1: Instantiate a reducer
  BookReducer = Rack::Reducer.new(
    Book.all,
    ->(category:) { where(category: category) },
  )


end
