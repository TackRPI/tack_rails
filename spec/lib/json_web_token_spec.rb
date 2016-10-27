require 'spec_helper'

RSpec.describe JsonWebToken do

  before do
    @user = FactoryGirl.build(:user)
  end

  # Loads
  it 'is available as described_class' do
    expect(described_class).to eq(JsonWebToken)
  end

  # JsonWebToken.encode()
  describe '.encode' do
    it 'should encode the payload' do
      @token = described_class.encode({ user_id: @user.id.to_s })
      expect( @token ).to be_truthy
    end
  end

  # JsonWebToken.decode()
  describe '.decode' do
    before do
      @token = described_class.encode({ user_id: @user.id.to_s })
    end

    it 'should decode the JWT' do
      decoded = described_class.decode(@token)
      expect( decoded[:user_id] ).to eq(@user.id.to_s)
    end
  end

end
