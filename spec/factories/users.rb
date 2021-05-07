FactoryBot.define do
  
  factory :user do
    nickname {'アナゴ'}
    password {'password'}
    password_confirmation {'password'}
    # tag_ids { '1' }
  end
end