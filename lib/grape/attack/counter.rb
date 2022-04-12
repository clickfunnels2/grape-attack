module Grape
  module Attack
    class Counter
      attr_reader :request, :adapter

      def initialize(request, adapter)
        @request = request
        @adapter = adapter
      end

      def value
        @value ||= begin
          adapter.get(key).to_i
        rescue ::Grape::Attack::StoreError
          1
        end
      end

      def update
        adapter.atomically do |instance|
          instance.incr(key)
          instance.expire(key, ttl_in_seconds)
        end
      rescue ::Grape::Attack::StoreError
      end

      private

      def key
        request.client_identifier
      end

      def ttl_in_seconds
        request.throttle_options.per.to_i
      end
    end
  end
end
