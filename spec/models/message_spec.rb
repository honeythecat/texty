require 'rails_helper'

describe Message, :vcr => true do
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '5005550001', :from => '5005550006')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 5005550001 is not a valid phone number."]
  end


end
