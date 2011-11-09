FactoryGirl.define do
	factory :user do
	  email                 "zhangchao51@163.com"
	  password              "zc19860721"
	  password_confirmation "zc19860721"
	  confirmed_at          Date.today
	end

  factory :baby do
	  name 									"Maitianer"
	  nick_name 						"XiaoNiZi"
	  birthday 							Date.today - 30.days
	  sex 									1
	  association 					:user
	end

	factory :timeline do
		title "Baby Timeline"
		description "Baby Timeline Description"
		status 1
		url_alias "demo"
		association :baby
	end

	factory :photo do
		title "Baby Photo"
		image File.open(File.join(Rails.root, 'spec', 'support', 'photos', 'demo1.jpg'))
		description "Baby Photo Description"
		privacy_strategy 1
		status 1
		association :timeline
	end
end