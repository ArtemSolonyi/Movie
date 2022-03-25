FactoryBot.define do
  factory :user do
    email { "my@mail.com" }
    password { "Lemon123" }
    password_confirmation { "Lemon123" }
  end
end