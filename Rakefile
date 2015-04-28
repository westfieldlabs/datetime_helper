require "bundler/gem_tasks"
require 'rspec/core/rake_task'

task :default => [:spec]

desc "Validate the gemspec"
task :gemspec do
  gemspec = eval(File.read(Dir["*.gemspec"].first))
  gemspec.validate && puts('gemspec valid')
end

RSpec::Core::RakeTask.new(:spec)
