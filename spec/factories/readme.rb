FactoryGirl.define do
  factory :readme do
		text { Faker::Name.last_name }
  end
end