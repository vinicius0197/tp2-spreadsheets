def get_file_words(file_name)
  lines = []
  words_list = []
  text=File.open(file_name).read
  text.gsub!(/\r\n?/, "\n")
  text.each_line do |line|
    lines.push(line)
  end

  lines.each do |line|
    words = line.split(/\W+/)
    words.each do |word|
      words_list.push(word.downcase)
    end
  end

  return words_list
end

def get_stopwords
  stopwords_list = []

  text = File.open('./stopwords.txt').read
  text.gsub!(/\r\n?/, "\n")
  text.each_line do |line|
    stopwords_list.push(line)
  end

  return stopwords_list
end