require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do

  it 'test loads' do
    phone_number = build(:phone_number, label: 'PhoneNumber 01')
    expect(phone_number.label).to eq('PhoneNumber 01')
  end

end
