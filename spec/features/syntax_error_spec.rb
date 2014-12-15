require 'spec_helper'

describe 'Ruby parser finds a syntax error and has to abort execution' do
  let(:starting_token) { "Hi!" }
  let(:ending_token)   { "Here's the error from Ruby:" }

  context 'unexpected character' do
    let(:message) { "You may have missed an argument and ended this line early with a semicolon." }
    let(:regex_test) do
      /(#{starting_token}) (#{message}) (#{ending_token}) (syntax error, unexpected ';')/
    end 

    it 'prints our humanist error when an invalid character is found' do
      expect{ eval("1+;") }.to raise_exception(SyntaxError, regex_test)
    end
  end
end
