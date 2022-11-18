require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        name: "Name",
        bio: "MyText",
        gender: "male",
        total_books: 2,
        summary: "MyText"
      ),
      Author.create!(
        name: "Name",
        bio: "MyText",
        gender: "male",
        total_books: 2,
        summary: "MyText"
      )
    ])
  end

  it "renders a list of authors" do
    render
    # cell_selector = 'tr>td'
    # assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("male".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
