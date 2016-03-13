require 'rails_helper'

RSpec.describe "appreciations/show", type: :view do
  before(:each) do
    @appreciation = assign(:appreciation, Appreciation.create!(
      :content => "MyText",
      :remark => "Remark",
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Remark/)
    expect(rendered).to match(//)
  end
end
