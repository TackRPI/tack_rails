
# User mock factory
FactoryGirl.define do

  factory :user do
    username              'exampleUser'
    display_name          'Example User'
    email                 'user@example.com'
    password              'topsecret'
    password_confirmation 'topsecret'
  end

end
