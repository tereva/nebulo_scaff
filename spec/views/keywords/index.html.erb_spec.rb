require 'rails_helper'

RSpec.describe "keywords/index", type: :view do
  before(:each) do
    assign(:keywords, [
      Keyword.create!(
        :word => "Word"
      ),
      Keyword.create!(
        :word => "Word"
      )
    ])
  end

  it "renders a list of keywords" do
    render
    assert_select "tr>td", :text => "Word".to_s, :count => 2
  end
end
