require_relative '../Spreadsheet/functions'
require 'byebug'

RSpec.describe Spreadsheet do
  include Spreadsheet
  
  before(:all) do
    @all_words = [['test', 'test', 'this', 'example'], nil]
    @stop_words = [['this', 'is'], nil]
  end

  it 'gets non stop words' do
    non_stop_words = [[], lambda { get_non_stop_words(@all_words, @stop_words) }]
    non_stop_words[0] = non_stop_words[1].call()
    expect(non_stop_words[0]).not_to be_empty
  end
end