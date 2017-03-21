FactoryGirl.define do
  factory :book do
		autor {Faker::Name.first_name}
		text {Faker::Name.last_name}
		available {{ auto_resolve: false, auto_define: true }}
		pages {Faker::Number.between(1,4)}
  end
end