require 'spec_helper'


describe User do

  it { should have_valid(:email).when('kate@example.com') }
  it { should_not have_valid(:email).when(nil, '', 'kate') }

end
