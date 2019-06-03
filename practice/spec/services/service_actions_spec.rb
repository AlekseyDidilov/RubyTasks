describe 'Services' do
  before(:each) do
    @service_name = 'vpnagent'
    @status_stopped = SERVICES::STOPPED
    @status_running = SERVICES::RUNNING
  end

  it 'should be stopped and started again properly' do
    SERVICES.service_start(@service_name) unless SERVICES.service_status(@service_name) == @status_running
    sleep 1
    SERVICES.service_stop(@service_name)
    expect(SERVICES.service_status(@service_name)).to eql @status_stopped
    SERVICES.service_start(@service_name)
    expect(SERVICES.service_status(@service_name)).to eql @status_running
  end
end
