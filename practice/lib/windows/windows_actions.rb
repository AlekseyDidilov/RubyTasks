module Windows
  def self.reboot_machine(seconds)
    system("shutdown /r /t #{seconds}")
  end
end
