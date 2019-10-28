module Spreadsheet
  def get_non_stop_words(all_words, stop_words)
    all_words[0].map { |w| 
    if(stop_words[0].include? w << "\n") 
      ""
    else
      w
    end
    }
  end
  
  def get_unique_words(non_stop_words)
    unique = []
    non_stop_words[0].each do |w|
      if(w != "" && (!unique.include? w))
        unique.push(w)
      end
    end
    return unique
  end
  
  def get_counts(unique_words, non_stop_words)
    unique_counts = []
    unique_words[0].each do |unique_word|
      counter = 0
      non_stop_words[0].each do |word|
        if(word == unique_word)
          counter += 1
        end
      end
      unique_counts.push(counter)
    end
    return unique_counts
  end
  
  def sort_data(unique_words, counts)
    unsorted_hash = Hash.new()
    unique_words[0].each_with_index do |word, index|
      unsorted_hash[word] = counts[0][index]
    end
  
    sorted_hash = unsorted_hash.sort_by { |key, value| value }
  
    sorted_list = []
    sorted_hash.each do |key, value|
      sorted_list.push(key)
    end
  
    return sorted_list
  end
end