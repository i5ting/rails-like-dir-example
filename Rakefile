# encoding: UTF-8
# require "bundler/gem_tasks"
require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run tests for all ORMs.'
task :default => :test

desc 'Run Devise tests for all ORMs.'
task :pre_commit do
  Dir[File.join(File.dirname(__FILE__), 'test', 'orm', '*.rb')].each do |file|
    orm = File.basename(file).split(".").first
    # "Some day, my son, rake's inner wisdom will reveal itself.  Until then,
    # take this `system` -- may its brute force protect you well."
    exit 1 unless system "rake test DEVISE_ORM=#{orm}"
  end
end

desc 'Run Devise unit tests.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for Devise.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Devise'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end






desc 'create dir '
task :createdir do
    `mkdir -p src/app/assets/images
  mkdir -p src/app/controllers 
  mkdir -p src/app/helpers        
  mkdir -p src/app/models      
  mkdir -p src/app/views

  mkdir src/db
  mkdir src/doc
  mkdir src/vendor
  mkdir src/log
  mkdir src/test
  mkdir src/script
  mkdir src/server

  mkdir -p src/config/environments
  mkdir -p src/config/initializers
  mkdir -p src/config/locales
`
end


desc 'create db '
task :createdb => :createdir do
  system('sqlite3 src/db/test.db "" ');
end

 
desc 'create db '
task :addsubmodule,:response do |t, args|
  p args
  # response = args[:response] || 'Task'
      # puts response
  # system('sqlite3 src/db/test.db "" ');
end
 

 
desc 'create db '
task :my_task, :arg1, :arg2 do |t, args|
  puts "Args were: #{args}"
end
