FactoryBot.define do
  
  factory :comment do
    content { 'テスト投稿' }
    association :user
    association :post
  end
end