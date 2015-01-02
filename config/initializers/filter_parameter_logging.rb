# Configure sensitive parameters which will be filtered from the log file.
[:password, :password_confirmation].each do |param|
  Rails.application.config.filter_parameters << param
end
