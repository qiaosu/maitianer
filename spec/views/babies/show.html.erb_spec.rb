require 'spec_helper'

describe "babies/show.html.erb" do
  before(:each) do
    @baby = assign(:baby, stub_model(Baby,
      :name => "Name",
      :nick_name => "Nick Name",
      :sex => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nick Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
