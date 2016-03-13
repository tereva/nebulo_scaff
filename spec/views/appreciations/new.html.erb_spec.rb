require 'rails_helper'

RSpec.describe "appreciations/new", type: :view do
  before(:each) do
    assign(:appreciation, Appreciation.new(
      :content => "MyText",
      :remark => "MyString",
      :category => nil
    ))
  end

  it "renders new appreciation form" do
    render

    assert_select "form[action=?][method=?]", appreciations_path, "post" do

      assert_select "textarea#appreciation_content[name=?]", "appreciation[content]"

      assert_select "input#appreciation_remark[name=?]", "appreciation[remark]"

      assert_select "input#appreciation_category_id[name=?]", "appreciation[category_id]"
    end
  end
end
