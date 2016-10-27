
# This will guess the Battery class
FactoryGirl.define do

  factory :user do
    username              'exampleUsername'
    email                 'user@example.com'
    password              'topsecret'
    password_confirmation 'topsecret'
  end

end
