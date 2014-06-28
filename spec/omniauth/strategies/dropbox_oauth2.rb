require 'spec_helper'

describe OmniAuth::Strategies::DropboxOauth2 do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::DropboxOauth2.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('dropbox_oauth2')
    end

    it 'should have correct site' do
      expect(subject.client.site).to eq('https://api.dropbox.com')
    end

    it 'should have correct authorize url' do
      expect(subject.client.authorize_url).to eq('https://www.dropbox.com/1/oauth2/authorize')
    end

    it 'should have correct token url' do
      expect(subject.client.token_url).to eq('https://api.dropbox.com/1/oauth2/token')
    end
  end

end