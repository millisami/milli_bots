require File.dirname(__FILE__) + '/spec_helper'

describe "Millibot::Server" do

  it 'should run a simple test' do
    visit '/'
    page.should have_content("Millibots")
  end
end