require 'rails_helper'

RSpec.describe ContactMethod, type: :model do

  it 'test loads' do
    contact_method = build(:contact_method, label: 'Contact Method 01')
    expect(contact_method.label).to eq('Contact Method 01')
  end

end
