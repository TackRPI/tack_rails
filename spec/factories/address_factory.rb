
# Address mock factory
FactoryGirl.define do

  factory :address do
    label         'Home Address'
    streetAddress '123 Spring St.'
    locality      'Troy'
    region        'NY'
    postalCode    '12180'
    country       'USA'
  end

end
