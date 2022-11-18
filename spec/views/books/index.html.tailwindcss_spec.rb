require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      FactoryBot.create(:book),
      FactoryBot.create(:book)
    ])

    assign(:authors, [
      FactoryBot.create(:author),
      FactoryBot.create(:author)
    ])
  end

  it "renders a list of books" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Year".to_s), count: 2
  end
end
