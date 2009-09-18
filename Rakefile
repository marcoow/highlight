require 'rake'
require 'rake/rdoctask'
require 'spec/rake/spectask'
 
desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs on the CI server.'
Spec::Rake::SpecTask.new(:ci) do |t|
  t.spec_opts << '--format=specdoc'
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Run the specs.'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts << '--color'
  t.spec_opts << '--format=html:doc/spec.html'
  t.spec_opts << '--format=specdoc'
  t.rcov_opts << '--exclude "gems/*,spec/*,init.rb"'
  t.rcov       = true
  t.rcov_dir   = 'doc/coverage'
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Generate documentation for Highlight.'
Rake::RDocTask.new(:rdoc) do |t|
  t.rdoc_dir = 'doc'
  t.title    = 'Highlight'
  t.options << '--line-numbers' << '--inline-source'
  t.rdoc_files.include('README.rdoc')
  t.rdoc_files.include('lib/**/*.rb')
end
