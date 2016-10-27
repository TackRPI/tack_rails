require 'rails_helper'

RSpec.describe Battery, type: :model do

  it 'test loads' do
    battery = build(:battery, name: 'CM BATTERY 9999')
    expect(battery.name).to eq('CM BATTERY 9999')
  end

end
