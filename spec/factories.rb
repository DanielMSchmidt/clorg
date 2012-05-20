# By using the Symbol :user, we get Factory Girl to simulate the user model

FactoryGirl.define do
  factory :user do
    name                  "Daniel Schmidt"
    email                 "big-dane@gmx.de"
    password              "safepassword"
    password_confirmation "safepassword"
  end

FactoryGirl.sequence :email do |n|
  "person-#{n}@example.de"
end

FactoryGirl.sequence :Name do |n|
  "My #{n}th Name"
end


end
