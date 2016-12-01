require 'rails_helper'

RSpec.describe Address, type: :model do

  it 'test loads' do
    address = build(:address, label: 'Address 01')
    expect(address.label).to eq('Address 01')
  end

end
