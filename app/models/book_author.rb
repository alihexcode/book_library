class BookAuthor < ApplicationRecord
  belongs_to :author, counter_cache: :total_books
  belongs_to :book, counter_cache: :total_authors
end
