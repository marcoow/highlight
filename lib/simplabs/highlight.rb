module Simplabs

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
      :mysql         => ['mysql'],
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
      :sql           => ['sql'],
      :xml           => ['xml', 'xsd'],
      :xslt          => ['xslt'],
      :yaml          => ['yaml', 'yml']
    }

  end

end
