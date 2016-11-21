
# This will guess the Battery class
FactoryGirl.define do

  factory :user do
    username              'exampleUser'
    display_name          'Example User'
    email                 'user@example.com'
    password              'topsecret'
    password_confirmation 'topsecret'
  end

end
