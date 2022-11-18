require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, Author.new(
      name: "MyString",
      bio: "MyText",
      gender: "male",
      total_books: 1,
      summary: "MyText"
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input[name=?]", "author[name]"

      assert_select "input[name=?]", "author[bio]"

      assert_select "select[name=?]", "author[gender]"

      assert_select "input[name=?]", "author[summary]"
    end
  end
end
