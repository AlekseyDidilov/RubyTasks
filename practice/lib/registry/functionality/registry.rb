require 'win32/registry'

module WindowsRegistry
  def self.create_key(key_path, key_name, key_value)
    Win32::Registry::HKEY_CURRENT_USER.create(key_path) { |key| key[key_name] = key_value }
  end

  def self.check_value(key_path, key_name)
    Win32::Registry::HKEY_CURRENT_USER.create(key_path) { |key| key[key_name] }
  end
end

