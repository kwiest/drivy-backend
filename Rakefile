lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rake/testtask'
require 'level1/main'
require 'level2/main'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end
desc "Run tests"

task default: :test

desc "Level 1"
task :level1 do
  p "Running Level 1..."
  p Level1.new.to_json
end

desc "Level 2"
task :level2 do
  p "Running Level 2..."
  p Level2.new.to_json
end
