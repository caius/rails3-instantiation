ActiveSupport::Notifications.subscribe("instantiation.active_record") do |name, start, finish, id, payload|
  duration = (finish - start).to_f.round(4)
  Rails.logger.info "Instantiating #{payload[:record_count]} instance(s) of #{payload[:class_name]} took #{duration}s"
end
