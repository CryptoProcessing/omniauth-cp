require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cp < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => ENV['CP_HOST'] || 'https://cryptoprocessing.io',
        :authorize_url => "#{ENV['CP_HOST'] || 'https://cryptoprocessing.io')}/oauth/authorize",
        :token_url => "#{ENV['CP_HOST'] || 'https://cryptoprocessing.io')}/oauth/token"
      }

      def request_phase
        super
      end

      # def authorize_params
      #   super.tap do |params|
      #     %w[scope client_options].each do |v|
      #       if request.params[v]
      #         params[v.to_sym] = request.params[v]
      #       end
      #     end
      #   end
      # end

      uid { raw_info['id'].to_s }

      info do
        {
          'email' => raw_info['email']
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('user').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'cp', 'CP'
