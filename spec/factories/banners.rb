FactoryBot.define do
  
  factory :banner do
    banner_name { 'hogehogeナンバー募集' }
    banner_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/event03.png'))}
    association :user
    # association :banner_tag
  end
end