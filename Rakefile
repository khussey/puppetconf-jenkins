require 'rubygems'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

task :setup_ci_reporter do
  Rake::Task['ci:setup:rspec'].execute
end

FileList['spec/hosts/*_spec.rb'].each do |test|
  name = File.basename(test, '_spec.rb')

  desc "Run RSpec tests for deployment #{name}"
  task name => :setup_ci_reporter do
    ENV['CI_REPORTS'] = File.expand_path("#{Dir.getwd}/spec/reports/hosts/#{name}")
    Rake::Task['ci:setup:spec_report_cleanup'].execute
  end

  desc ''
  RSpec::Core::RakeTask.new(name) do |t|
    t.rspec_opts = ['--color']
    t.rspec_opts = ['--failure-exit-code=0']
    t.pattern = test.gsub(/[*?\[\]{}\\]/) { '\\' << $& }
  end
end
