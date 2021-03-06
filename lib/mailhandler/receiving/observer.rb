# frozen_string_literal: true

module MailHandler
  module Receiving
    # observer handler
    module Observer
      def init_observer
        @observers = []
      end

      def observers
        @observers
      end

      def add_observer(observer)
        @observers ||= []
        @observers << observer
      end

      def delete_observer(observer)
        @observers.delete(observer) if @observers
      end

      def notify_observers(search)
        @observers.each { |observer| observer.notify(search) } if @observers
      end
    end
  end
end
