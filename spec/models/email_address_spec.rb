require 'rails_helper'

RSpec.describe EmailAddress, type: :model do

  it 'test loads' do
    email_address = build(:email_address, label: 'Email 01')
    expect(email_address.label).to eq('Email 01')
  end

end
