require 'rails_helper'

RSpec.describe "appreciations/edit", type: :view do
  before(:each) do
    @appreciation = assign(:appreciation, Appreciation.create!(
      :content => "MyText",
      :remark => "MyString",
      :category => nil
    ))
  end

  it "renders the edit appreciation form" do
    render

    assert_select "form[action=?][method=?]", appreciation_path(@appreciation), "post" do

      assert_select "textarea#appreciation_content[name=?]", "appreciation[content]"

      assert_select "input#appreciation_remark[name=?]", "appreciation[remark]"

      assert_select "input#appreciation_category_id[name=?]", "appreciation[category_id]"
    end
  end
end
