require File.dirname(__FILE__) + '/../spec_helper'

describe Simplabs::Highlight::PygmentsWrapper do

  describe '#get_language_sym' do

    it 'should return false if the specified language is not supported' do
      Simplabs::Highlight::PygmentsWrapper.send(:get_language_sym, 'unsupported-language').should == false
    end

    it 'should return the respective symbol if the specified language is given as string and is supported' do
      Simplabs::Highlight::PygmentsWrapper.send(:get_language_sym, 'ruby').should == :ruby
    end

    it 'should return the respective symbol if the specified language is given as symbol and is supported' do
      Simplabs::Highlight::PygmentsWrapper.send(:get_language_sym, :rb).should == :ruby
    end

  end

  describe '#clean_result' do

    it 'should strip the specified text' do
      Simplabs::Highlight::PygmentsWrapper.send(:clean_result, ' result   ').should == 'result'
    end

    it 'should remove the surrounding <div class="highlight"><pre></pre></div> as added by pygments' do
      Simplabs::Highlight::PygmentsWrapper.send(:clean_result, '<div class="highlight"><pre>formatted code</pre></div>').should == 'formatted code'
    end

  end

  describe '#highlight' do

    before do
      now = Time.now
      Time.stub!(:now).and_return(now)
      @code = 'class Test; end'
      @tmp_file_name = "/tmp/highlight_#{Time.now.to_f}"
    end
    
    it 'should return the escaped code if the specified language is not supported' do
      Simplabs::Highlight::PygmentsWrapper.highlight(@code, 'unsupported language').should == CGI.escapeHTML(@code)
    end

    it "should create a file #{@tmp_file_name}" do
      File.open(@tmp_file_name, 'w') { |f| }
      File.should_receive(:open).once.with(@tmp_file_name, 'w')

      Simplabs::Highlight::PygmentsWrapper.highlight(@code, :ruby)
    end
    
    it 'should write the code to the created file' do
      Simplabs::Highlight::PygmentsWrapper.highlight(@code, :ruby)

      file_contents = ''
      File.open(@tmp_file_name, 'r') { |file| while (line = file.gets) do file_contents << line end }
      file_contents.strip.should == @code
    end

    it 'should clean the result' do
      Simplabs::Highlight::PygmentsWrapper.should_receive(:clean_result).once.with("<div class=\"highlight\"><pre><span class=\"k\">class</span> <span class=\"nc\">Test</span><span class=\"p\">;</span> <span class=\"k\">end</span>\n</pre></div>\n")
      
      Simplabs::Highlight::PygmentsWrapper.highlight(@code, :ruby)
    end
    
  end

end
