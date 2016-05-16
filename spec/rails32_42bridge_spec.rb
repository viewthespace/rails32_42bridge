require 'spec_helper'

describe Rails3242bridge do

  if Rails::VERSION::MAJOR == 4
    specify 'it is rails4' do
      expect(subject).to be_rails4
    end
  end

end
