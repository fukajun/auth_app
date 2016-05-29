FactoryGirl.define do
  factory :authentication do
    provider 'provider'
    sequence(:uid)
  end
end
