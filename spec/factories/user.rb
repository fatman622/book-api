FactoryGirl.define do
  factory :user do
		email {Faker::Internet.email}
		password "123456789"
		password_confirmation "123456789"
		name { Faker::Name.first_name }
		nickname { Faker::Name.last_name }
  end
end