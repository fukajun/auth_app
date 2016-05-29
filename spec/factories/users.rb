FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "#{n}.Taro Yamada" }
  end
end
