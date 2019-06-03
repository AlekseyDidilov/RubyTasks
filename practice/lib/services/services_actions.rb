module SERVICES
  STOPPED = 'STOPPED'.freeze
  RUNNING = 'RUNNING'.freeze

  def self.service_status(service_name)
    status_output = `SC query #{service_name}`
    if status_output.include?(RUNNING)
      RUNNING
    else
      STOPPED
    end
  end

  def self.service_start(service_name)
    system("SC start #{service_name}") unless service_status(service_name) == RUNNING
  end

  def self.service_stop(service_name)
    system("SC stop #{service_name}") unless service_status(service_name) == STOPPED
  end
end
