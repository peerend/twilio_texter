class Message < ActiveRecord::Base

  before_create :send_sms

private

  def send_sms
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :To => to,
                      :From => from}
        ).execute
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end 
  end
    # response = RestClient::Request.new(
    #   :method => :post,
    #   :url => 'https://api.twilio.com/2010-04-01/Accounts/ACa71001fc2145f799d7b2794bfb93397c/Messages.json',
    #   :user => 'ACa71001fc2145f799d7b2794bfb93397c',
    #   :password => '8644321b70a90d2ff1e49d8973516a55',
    #   :payload => { :Body => "Hello",
    #                 :To => '4253068942',
    #                 :From => '2673802361'}
    #   ).execute