module Api
  module V1
    class PaginationMetadata
      def initialize(resource)
        @resource = resource
      end

      def serialize
        {
          current_page: resource.current_page,
          next_page: resource.next_page,
          previous_page: resource.previous_page,
          total_pages: resource.total_pages,
          total_entries: resource.total_entries
        }
      end

      private

      attr_reader :resource
    end
  end
end
