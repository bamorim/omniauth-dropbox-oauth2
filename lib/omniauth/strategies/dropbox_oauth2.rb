require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class DropboxOauth2 < OmniAuth::Strategies::OAuth2
      option :name, "dropbox_oauth2"
      option :client_options, {
        :site               => 'https://api.dropbox.com',
        :authorize_url      => 'https://www.dropbox.com/1/oauth2/authorize',
        :token_url          => 'https://api.dropbox.com/1/oauth2/token'
      }

      uid { raw_info['uid'] }

      info do
        {
          'uid'   => raw_info['uid'],
          'name'  => raw_info['display_name'],
          'email' => raw_info['email']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/1/account/info').body)
      end

      def callback_url
        if @authorization_code_from_signed_request
          ''
        else
          options[:callback_url] || super
        end
      end
    end
  end
end
