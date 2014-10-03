FactoryGirl.define do
	factory :user do
		name					"John Doe"
		email					"john@example.com"
		password				"foobar"
		password_confirmation	"foobar"
	end

	factory :vinyl do
		cover		"http://www.cddesign.com/covertalk/images/dark-side-of-the-moon-cd-cover-design.jpg"
		artist		"Example Band"
		album		"Example Album"
		year		"1975"
		genre		"Example Genre"
	end
end