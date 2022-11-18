require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let(:book) { FactoryBot.create(:book) }
  before(:each) do
    assign(:book, book)

    assign(:authors, [
      FactoryBot.create(:author),
      FactoryBot.create(:author)
    ])
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(book), "post" do

      assert_select "input[name=?]", "book[content_name]"

      assert_select "input[name=?]", "book[isbn]"

      assert_select "input[name=?]", "book[original_title]"

      assert_select "input[name=?]", "book[year]"

      assert_select "input[name=?]", "book[language_code]"

      assert_select "input[name=?]", "book[category]"

      assert_select "input[name=?]", "book[plot]"

      assert_select "input[name=?]", "book[copyright]"

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[average_rating]"

      assert_select "input[name=?]", "book[rating_count]"

      assert_select "input[name=?]", "book[description]"

      assert_select "input[name=?]", "book[loc_class]"

      assert_select "input[name=?]", "book[language]"

      assert_select "input[name=?]", "book[pages]"

      assert_select "input[name=?]", "book[isbn13]"

      assert_select "input[name=?]", "book[cover]"

      assert_select "input[name=?]", "book[summary]"

      assert_select "input[name=?]", "book[content_cleaned]"

      assert_select "input[name=?]", "book[content_available]"
    end
  end
end
