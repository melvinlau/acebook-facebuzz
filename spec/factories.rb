FactoryBot.define do
  factory :comment do
    message { "MyText" }
    user_id { 1 }
    post_id { 1 }
  end
  
  factory :user do
    first_name { "Test" }
    last_name { "Test" }
    email { "test@google.com" }
    password { "123456" }
    id { "1" }
  end
end
