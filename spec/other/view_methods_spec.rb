require File.dirname(__FILE__) + '/../spec_helper'

describe Simplabs::Highlight::ViewMethods do

  include Simplabs::Highlight::ViewMethods

  before do
    @ruby_code = 'class Test; end'
    Simplabs::Highlight.initialized = true
  end

  describe '#highlight' do

    it 'should raise an exception if both a text and a block are specified' do
      lambda { highlight(:ruby, 'text') { 'text from block' } }.should raise_error(Simplabs::Highlight::HighlightException)
    end

    it 'should return text as is if the plugin is not initialized' do
      Simplabs::Highlight.initialized = false

      highlight(:ruby, @ruby_code).should == @ruby_code
    end

    it 'should call Simplabs::PygmentsWrapper.highlight with the language and code' do
      Simplabs::Highlight::PygmentsWrapper.should_receive(:highlight).once.with(@ruby_code, :ruby)

      highlight(:ruby, @ruby_code)
    end

    it 'should not yield to block if a text is given' do
      lambda { highlight(:ruby, @ruby_code) { raise MyBlockException.new } }.should_not raise_error(MyBlockException)
    end

    it 'should yield to block if no text is given' do
      lambda { highlight(:ruby) { raise MyBlockException.new } }.should raise_error(MyBlockException)
    end

    it 'should correctly highlight source code passed as parameter' do
      highlight(:ruby, @ruby_code).should == "<span class=\"k\">class</span> <span class=\"nc\">Test</span><span class=\"p\">;</span> <span class=\"k\">end</span>\n"
    end

    it 'should correctly highlight source code passed via a block' do
      (highlight(:ruby) do
        @ruby_code
      end).should == "<span class=\"k\">class</span> <span class=\"nc\">Test</span><span class=\"p\">;</span> <span class=\"k\">end</span>\n"
    end

  end

end

class MyBlockException < Exception; end
