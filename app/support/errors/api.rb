# frozen_string_literal: true

module Errors
  module Api
    class BadRequestError < SafeError
      def http_status
        400
      end
    end

    class UnauthorizedError < SafeError
      def message
        @message || 'Not Authorized'
      end

      def http_status
        401
      end
    end

    class NotFoundError < SafeError
      def message
        @message || 'Not Found'
      end

      def http_status
        404
      end
    end

    class ForbiddenError < SafeError
      def http_status
        403
      end
    end

    class InvalidTokenError < SafeError
      def message
        @message || 'Auth token is expired or invalid'
      end

      def http_status
        419 # unofficial timeout status code
      end
    end

    class UnprocessableEntityError < SafeError
      def http_status
        422
      end
    end

    class ServerError < SafeError
      def message
        if Rails.env.test? || Rails.env.development?
          @message
        else
          # rubocop:disable Layout/LineLength
          'We have encountered an error processing the request. Please try again, and if the problem persists, contact support.'
          # rubocop:enable Layout/LineLength
        end
      end

      def http_status
        500
      end
    end
  end
end
