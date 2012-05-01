# By using the Symbol :user, we get Factory Girl to simulate the user model

FactoryGirl.define do
  factory :user do
    name                  "Daniel Schmidt"
    email                 "big-dane@gmx.de"
    password              "safepassword"
    password_confirmation "safepassword"
  end
end