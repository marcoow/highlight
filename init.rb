require 'simplabs/highlight'

if IO::popen("which pygmentize").read == ''
  puts " ** [Highlight] pygments cannot be found, highlighting code won't work!"
  Simplabs::Highlight.initialized = false
else
  Simplabs::Highlight.initialized = true
end

ActionView::Base.class_eval do
  include Simplabs::Highlight::ViewMethods
end
