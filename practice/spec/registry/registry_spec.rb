describe 'RegestryCheck' do
  before(:each) do
    @key_path = 'Software\\foo'
    @key_name = 'foo'
    @reboot_value = 1
    @startup_folder = File.join(Dir.home, 'AppData', 'Roaming', 'Microsoft', 'Windows',
                                'Start Menu', 'Programs', 'Startup')
    @test_data_file = File.join(Dir.pwd, 'lib', 'registry', 'test_data', 'file_registry.txt')
    @batch_file = File.join(Dir.home, 'batch', 'registry', 'registry.bat')
    @text_to_add = 'Text in file'
  end

  it 'should append text to file and reboot machine', before_reboot: true do
    WindowsRegistry.create_key(@key_path, @key_name, @reboot_value)
    match_key_status = WindowsRegistry.check_value(@key_path, @key_name)
    expect(match_key_status).to eq 1
    # FileUtils.copy(@batch_file, @startup_folder)
    File.write(@test_data_file, @text_to_add, mode: 'w')
    Windows.reboot_machine 5
  end

  it 'should verify that text contains in file after reboot', after_reboot: true do
    FileUtils.rm(File.join(@startup_folder, 'registry.bat'))
    match_occurrence = RegexPatterns.count_occurrence(@test_data_file, @text_to_add)
    expect(match_occurrence).to eq 1
  end
end
