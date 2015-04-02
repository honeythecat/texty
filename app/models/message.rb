class Message < ActiveRecord::Base
  before_create :send_sms

  private

    def send_sms
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/ACc46287e9fb8e137bf0b9b29569948d5b/Messages.json',
        :user => 'ACc46287e9fb8e137bf0b9b29569948d5b',
        :password => 'ce41d4bb2e4f82fc347c372dbc6eedd8',
        :payload => { :Body => body,
                      :From => from,
                      :To => to }
      ).execute
  end
end
