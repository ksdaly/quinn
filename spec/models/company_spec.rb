require 'spec_helper'

describe Company do

  it { should have_valid(:display_name).when('Umbrella Corporation') }
  it { should_not have_valid(:display_name).when(nil, '') }

end
