lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rake/testtask'
require 'level1/main'
require 'level2/main'
require 'level3/main'
require 'level4/main'

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
  p "Desired output:"
  p JSON.parse(File.read("lib/level2/output.json")).to_s
  p "Actual output:"
  p Level2.new.to_json
end

desc "Level 3"
task :level3 do
  p "Running Level 3..."
  p "Desired output:"
  p JSON.parse(File.read("lib/level3/output.json")).to_s
  p "Actual output:"
  p Level3.new.to_json
end

desc "Level 4"
task :level4 do
  p "Running Level 4..."
  p "Desired output:"
  p JSON.parse(File.read("lib/level4/output.json")).to_s
  p "Actual output:"
  p Level4.new.to_json
end
