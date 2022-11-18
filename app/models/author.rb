# == Schema Information
#
# Table name: authors
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  bio         :text(65535)
#  gender      :string(255)
#  total_books :integer
#  summary     :text(65535)
#  born        :date
#  died        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Author < ApplicationRecord
  include FormattedAttr
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors
  has_formatted_date :born, :died
  has_shorten_text :bio, :summary
  has_rich_text :bio
  has_rich_text :summary

  enum :gender, [ :male, :female ]
end
