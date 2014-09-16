require 'rails_helper'

describe Message, :vcr => true do
  it 'gives an error if the to number is invalid' do
    message = Message.new(:body => 'Hello', :to =>'11111', :from => '2673802361')
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 11111 is not a valid phone number."]
  end
end