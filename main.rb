require './helpers'
require 'byebug'

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

# Definição das colunas utilizando o método Spreadsheets (lista de valores e função)
all_words = [[], nil]
stop_words = [[], nil]
non_stop_words = [[], lambda { get_non_stop_words(all_words, stop_words) }]
unique_words = [[], lambda { get_unique_words(non_stop_words) }]
counts = [[], lambda { get_counts(unique_words, non_stop_words) }]
sorted_data = [[], lambda { sort_data(unique_words, counts) }]

# Inicialização com os parâmetros de entrada
all_words[0] = get_file_words 'input.txt'
stop_words[0] = get_stopwords

all_columns = [all_words, stop_words, non_stop_words, unique_words, counts, sorted_data]

# Função de atualização da planilha (pode ser executada periodicamente ou toda vez que os dados são atualizados)
def update(cols)
  cols.each do |col|
    if(col[1] != nil)
      col[0] = col[1].call()
    end
  end
end

update(all_columns)

puts "Palavras em ordem crescente de ocorrência: \n"
sorted_data[0].each do |elem|
  if elem.is_a? String
    puts elem
  end
end