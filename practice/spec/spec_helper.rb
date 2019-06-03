require 'require_all'
require 'faker'
require 'selenium-webdriver'
require 'rspec'

# Path to the lib and ruby directories
LIB_PATH = File.join('..', 'lib').freeze
RUBY_PATH = File.join('..', 'ruby').freeze

# Allows to interact with any files from this directories
require_rel(LIB_PATH, RUBY_PATH)
