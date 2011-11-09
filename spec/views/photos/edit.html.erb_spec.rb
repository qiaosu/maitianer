require 'spec_helper'

describe "photos/edit.html.erb" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :title => "MyString",
      :image => "MyString",
      :description => "MyString",
      :privacy_strategy => 1,
      :status => 1,
      :timeline => nil
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path(@photo), :method => "post" do
      assert_select "input#photo_title", :name => "photo[title]"
      assert_select "input#photo_image", :name => "photo[image]"
      assert_select "input#photo_description", :name => "photo[description]"
      assert_select "input#photo_privacy_strategy", :name => "photo[privacy_strategy]"
      assert_select "input#photo_status", :name => "photo[status]"
      assert_select "input#photo_timeline", :name => "photo[timeline]"
    end
  end
end
