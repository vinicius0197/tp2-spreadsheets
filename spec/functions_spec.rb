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

  it 'gets unique words' do
    non_stop_words = [["test", "test", "example"], nil]
    unique_words = [[], lambda { get_unique_words(non_stop_words) }]
    unique_words[0] = unique_words[1].call()
    expect(unique_words[0]).not_to be_empty
    expect(unique_words[0].uniq.length).to eq(unique_words[0].length)
  end

  it 'counts number of unique words' do
    non_stop_words = [["test", "test", "example"], nil]
    unique_words = [["test", "example"], nil]
    counts = [[], lambda { get_counts(unique_words, non_stop_words) }]
    counts[0] = counts[1].call()
    expect(counts[0]).not_to be_empty
    expect(counts[0][0]).to eq(2)
  end

  it 'sorts data' do
    unique_words = [["test", "example", "sheet"], nil]
    counts = [[2, 1, 3], nil]
    sorted_data = [[], lambda { sort_data(unique_words, counts) }]
    sorted_data[0] = sorted_data[1].call()
    expect(sorted_data[0]).not_to be_empty
    expect(sorted_data[0].find_index('test')).to eq(1)
    expect(sorted_data[0].find_index('sheet')).to eq(2)
  end
end