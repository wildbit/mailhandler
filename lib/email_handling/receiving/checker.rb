class Clock

  module SECONDS

    DAY = 86400
    HOUR = 3600

  end

  def self.time_days_ago(days)

    Time.now - days*SECONDS::DAY

  end

  def self.time_hours_ago(hours)

    Time.now - hours*SECONDS::HOUR

  end

end


module EmailHandling

  module Receiving

    # email receiving checker interface
    # all email checking types need to implement it
    # it is used for checking whether email is in your inbox
    class Checker

      attr_accessor :search_options,
                    :found_emails

      AVAILABLE_SEARCH_OPTIONS = [

          :by_subject,
          :by_content,
          :by_date,
          :by_recipient,
          :count,
          :archive

      ]

      def initialize

        # default number of email results to return
        @search_options = {:count => 10, :archive => false}

      end

      def find(options)

        unless (options.keys - AVAILABLE_SEARCH_OPTIONS).empty?
          raise StandardError, "#{(options.keys - AVAILABLE_SEARCH_OPTIONS)} - Incorrect search option values, options are #{AVAILABLE_SEARCH_OPTIONS}"
        end

        @search_options = search_options.merge options

      end

      def search_result

        found_emails != nil and !found_emails.empty?

      end

    end

  end

end
