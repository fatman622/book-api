FactoryGirl.define do
  factory :book_content do
		text { Faker::Name.last_name }
  end
end