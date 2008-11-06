puts "Copying highlight.css to #{RAILS_ROOT}/public/stylesheets/"
begin
File.copy(
  File.join(File.dirname(__FILE__), 'assets', 'stylesheets', 'highlight.css'),
  File.join(RAILS_ROOT, 'public', 'stylesheets')
)
rescue => e
  puts e.inspect
end
puts IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
