# == Schema Information
#
# Table name: authors
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  bio         :text(65535)
#  gender      :integer
#  total_books :integer
#  summary     :text(65535)
#  born        :date
#  died        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :author do
    name { "MyString" }
    bio { "MyText" }
    gender { [:male, :female].sample }
    total_books { 1 }
    summary { "MyText" }
    born { "2022-11-13" }
    died { "2022-11-13" }
  end
end
