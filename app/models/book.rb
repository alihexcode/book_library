# == Schema Information
#
# Table name: books
#
#  id                :bigint           not null, primary key
#  author_id         :bigint           not null
#  content_name      :string(255)
#  isbn              :string(255)
#  original_title    :string(255)
#  year              :string(255)
#  language_code     :string(255)
#  category          :string(255)
#  plot              :text(65535)
#  copyright         :string(255)
#  title             :string(255)
#  average_rating    :float(24)
#  rating_count      :integer
#  description       :text(65535)
#  loc_class         :string(255)
#  language          :string(255)
#  pages             :integer
#  isbn13            :string(255)
#  release_date      :date
#  cover             :string(255)
#  summary           :text(65535)
#  content_cleaned   :boolean
#  content_available :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Book < ApplicationRecord
  include FormattedAttr
  mount_uploader :cover, CoverUploader

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_formatted_date :release_date
  has_shorten_text :plot, :description, :summary
  has_rich_text :plot
  has_rich_text :description
  has_rich_text :summary

  validates :authors, presence: true

  scope :filter_by_authors, -> (author_ids) { joins(:authors).where(authors: { id: author_ids }) }
  scope :filter_by_years, -> (years) { where(year: years) }
  scope :filter_by_pages, -> (pages) { where(pages: pages[0]..pages[1]) }
  scope :filter_by_keyword, -> (keyword) { where('LOWER(title) LIKE ? OR LOWER(original_title) LIKE ? ', "%#{keyword}%", "%#{keyword}%") }

  def self.humanize_options_page
    [
      '< 100',
      '100-250',
      '250-500',
      '500-750',
      '750-1000',
      '> 1000',
    ]
  end

  def self.options_page(humanize_option)
    return unless humanize_option.present?

    range = humanize_option.split('-')
    return range.map(&:to_i) if range.count > 1

    if humanize_option.match('<')
      [0, humanize_option.delete("^0-9").to_i]
    elsif humanize_option.match('>')
      [humanize_option.delete("^0-9").to_i, 9999999999]
    else
      []
    end
  end
end
