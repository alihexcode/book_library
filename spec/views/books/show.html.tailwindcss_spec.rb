require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    assign(:book, FactoryBot.create(:book))
    render
  end

  it { expect(rendered).to match(/Content Name/) }
  it { expect(rendered).to match(/Isbn/) }
  it { expect(rendered).to match(/Original Title/) }
  it { expect(rendered).to match(/Year/) }
  it { expect(rendered).to match(/Language Code/) }
  it { expect(rendered).to match(/Category/) }
  it { expect(rendered).to match(/Copyright/) }
  it { expect(rendered).to match(/Title/) }
  it { expect(rendered).to match(/2.5/) }
  it { expect(rendered).to match(/3/) }
  it { expect(rendered).to match(/Loc Class/) }
  it { expect(rendered).to match(/Language/) }
  it { expect(rendered).to match(/4/) }
  it { expect(rendered).to match(/Isbn13/) }
  it { expect(rendered).to match(/Cover/) }
  it { expect(rendered).to match(/false/) }
  it { expect(rendered).to match(/false/) }
end
