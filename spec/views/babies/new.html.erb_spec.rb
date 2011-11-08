require 'spec_helper'

describe "babies/new.html.erb" do
  before(:each) do
    assign(:baby, stub_model(Baby,
      :name => "MyString",
      :nick_name => "MyString",
      :sex => 1,
      :user => nil
    ).as_new_record)
  end

  it "renders new baby form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => babies_path, :method => "post" do
      assert_select "input#baby_name", :name => "baby[name]"
      assert_select "input#baby_nick_name", :name => "baby[nick_name]"
      assert_select "input#baby_sex", :name => "baby[sex]"
      assert_select "input#baby_user", :name => "baby[user]"
    end
  end
end
