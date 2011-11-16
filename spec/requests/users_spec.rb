require 'spec_helper'

describe "Users" do
	describe "register" do
		describe "failure" do
			it "should not make a new user" do
        lambda do
          visit new_user_registration_path
          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          response.should render_template('devise/registrations/new')
          #response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
		end

		describe "success" do
		end
	end

	describe "login/logout" do
	end
end