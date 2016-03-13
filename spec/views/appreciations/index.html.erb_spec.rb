require 'rails_helper'

RSpec.describe "appreciations/index", type: :view do
  before(:each) do
    assign(:appreciations, [
      Appreciation.create!(
        :content => "MyText",
        :remark => "Remark",
        :category => nil
      ),
      Appreciation.create!(
        :content => "MyText",
        :remark => "Remark",
        :category => nil
      )
    ])
  end

  it "renders a list of appreciations" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Remark".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
