FactoryBot.define do
  
  factory :post do
    post_text { 'テスト投稿' }
    post_video { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/entertainer-top.mp4'))}
    association :user
  end
end