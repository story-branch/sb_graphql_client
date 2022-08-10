module StoryBranch
  module Graphql
    # Model to handle graphql response and make it more friendly. Detect if errors
    # are present in the reponse and marks the response as failed if so
    # gives a few accessors to data
    class Response
      def initialize(response:)
        @response = response
      end

      def data
        @data ||= @response.parsed_response['data']
      end

      def success?
        errors.nil? && @response.success?
      end

      def errors
        return @errors if @errors

        @errors = if @response.success?
                    @response.parsed_response['errors']
                  else
                    [@response.response, @response.parsed_response]
                  end
      end

      def full_error_messages
        errors.join("\n")
      end
    end
  end
end
