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
require 'rails_helper'

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
