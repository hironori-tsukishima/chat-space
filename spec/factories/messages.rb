FactoryGirl.define do
  factory :message do
    text              Faker::HarryPotter.quote
    image             File.open("#{Rails.root}/public/images/no_image.jpg")
    user_id              10
    group_id             10
    # user_id           rand(10)
    # group_id          rand(10)
  end
end
