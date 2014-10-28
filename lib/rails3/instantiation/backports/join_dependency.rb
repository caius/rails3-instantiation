#
# Backport of https://github.com/rails/rails/commit/2a0d97bc89fc230241453cbbf55621309e1f3ac6
#
module ActiveRecord
  module Associations
    class JoinDependency # :nodoc:

      def instantiate(rows)
        primary_key = join_base.aliased_primary_key
        parents = {}

        message_bus = ActiveSupport::Notifications.instrumenter

        payload = {
          record_count: result_set.length,
          class_name: join_root.base_klass.name
        }

        message_bus.instrument("instantiation.active_record", payload) do
          records = rows.map { |model|
            primary_id = model[primary_key]
            parent = parents[primary_id] ||= join_base.instantiate(model)
            construct(parent, @associations, join_associations, model)
            parent
          }.uniq

          remove_duplicate_results!(active_record, records, @associations)
        end
        records
      end

    end
  end
end
