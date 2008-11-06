require File.dirname(__FILE__) + '/../spec_helper'

describe Simplabs::Highlight::ViewMethods do

  include Simplabs::Highlight::ViewMethods

  before do
    @ruby_code = 'class Test; end'
    Simplabs::Highlight.initialized = true
  end

  describe '#highlight' do

    it 'should return text as is if the plugin is not initialized' do
      Simplabs::Highlight.initialized = false

      highlight(:ruby, @ruby_code).should == @ruby_code
    end

    it 'should call Simplabs::PygmentsWrapper.highlight with the language and code' do
      Simplabs::Highlight::PygmentsWrapper.should_receive(:highlight).once.with(@ruby_code, :ruby)

      highlight(:ruby, @ruby_code)
    end

    it 'should correctly highlight source code passed as parameter' do
      highlight(:ruby, @ruby_code).should == "<span class=\"k\">class</span> <span class=\"nc\">Test</span><span class=\"p\">;</span> <span class=\"k\">end</span>\n"
    end

  end

end
