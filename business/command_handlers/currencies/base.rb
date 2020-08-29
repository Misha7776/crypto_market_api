module CommandHandlers
  module Currencies
    class Base
      def initialize(command)
        @command = command
        @params = record_params(command)
      end

      def self.call(command)
        new(command).call
      end

      def call; end

      private

      attr_reader :command, :params, :record

      def record_params(command); end
    end
  end
end
