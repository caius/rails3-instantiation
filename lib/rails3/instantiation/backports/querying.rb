#
# Backport of https://github.com/rails/rails/commit/2a0d97bc89fc230241453cbbf55621309e1f3ac6
#
module ActiveRecord
  module Querying

    def find_by_sql(sql, binds = [])
      result_set = logging_query_plan do
        connection.select_all(sanitize_sql(sql), "#{name} Load", binds)
      end

      message_bus = ActiveSupport::Notifications.instrumenter

      payload = {
        record_count: result_set.length,
        class_name: name
      }

      result_set.collect { |record| instantiate(record) }
    end

  end
end
