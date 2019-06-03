FILE_PATH = File.join(
    'C:', 'Users', 'odidi', 'RubyTasks', 'practice', 'lib', 'jenkins', 'test_data', 'jenkins_add.txt'
).freeze

def add_parameter(parameter)
  File.write(FILE_PATH, parameter)
  puts File.read(FILE_PATH)
end

add_parameter(ARGV[0])
