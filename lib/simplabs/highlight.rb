module Simplabs

  # Highlight is a simple source code highlighting plugin for Ruby on Rails. It's basically a wrapper around the python project
  # pygments (http://pygments.org/) that support various languages.
  #
  # The plugin adds a new method available in all templates:
  #
  #  highlight(language, code)
  #
  # where language can be either a symbol or a string (most file extensions should work for example)
  #
  # To perform the highlighting, the code is first written to a file in /tmp, e.g.:
  #
  #  /tmp/highlight_1225993290.70882
  #
  # Since writing that file, passing its contents on to pygments etc. takes a while, all highlighted source code should be cached
  # of course, e.g.:
  #
  #  <% cache do %>
  #    <%= highlight(:ruby) do -%>
  #      class Test
  #      end
  #    <% end -%>
  #  <% end %>
  module Highlight

    mattr_accessor :initialized

    SUPPORTED_LANGUAGES = {
      :as            => ['as', 'as3', 'actionscript'],
      :applescript   => ['applescript'],
      :bash          => ['bash', 'sh'],
      :c             => ['c', 'h'],
      :clojure       => ['clojure'],
      :cpp           => ['c++', 'cpp', 'hpp'],
      :csharp        => ['c#', 'csharp', 'cs'],
      :css           => ['css'],
      :diff          => ['diff'],
      :dylan         => ['dylan'],
      :erlang        => ['erlang'],
      :html          => ['html', 'htm'],
      :java          => ['java'],
      :js            => ['javascript', 'js', 'jscript'],
      :jsp           => ['jsp'],
      :make          => ['make', 'basemake', 'makefile'],
      :'objective-c' => ['objective-c'],
      :ocaml         => ['ocaml'],
      :perl          => ['perl', 'pl'],
      :php           => ['php'],
      :python        => ['python', 'py'],
      :rhtml         => ['erb', 'rhtml'],
      :ruby          => ['ruby', 'rb'],
      :scala         => ['scala'],
      :scheme        => ['scheme'],
      :smallralk     => ['smalltalk'],
      :smarty        => ['smarty'],
      :sql           => ['sql', 'mysql'],
      :xml           => ['xml', 'xsd'],
      :xslt          => ['xslt'],
      :yaml          => ['yaml', 'yml']
    }

  end

end
