require 'puppet'
require 'rspec-puppet'

RSpec.configure do |c|
  stack_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  manifest = 'manifests/stackhammer.pp'
  module_path = ['roles/production','modules']

  c.manifest = File.join(stack_root, manifest)
  c.module_path = module_path.map{ |element| File.join(stack_root, element) }.join(File::PATH_SEPARATOR)
end
