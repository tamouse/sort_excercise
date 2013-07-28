require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Run benchmarks on sorting algorithms"
task :bench do |t|
  sh 'bundle exec ruby bm/*_bm.rb'
end

task :default => :spec
