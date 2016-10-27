require 'spec_helper'

describe HTMLToPDFJob, :type => :model do

  before do
    ResqueSpec.reset!
  end

  describe 'self.perform' do
    it 'should test whatever code is run inside the perform method' do
      HTMLToPDFJob.perform()
    end
  end

end
