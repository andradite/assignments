require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "tests" << "help"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end