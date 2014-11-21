input_file_name = ARGV[0]
input_count = ARGV[1].to_i

def get_file(access) ####accesses the file that you enter at the terminal ex. poe_shelly.txt
File.read(access)
end

####the text in the file gets downcased and split into individual string and put into an array
def word_array(sort_file)
  get_file(sort_file).downcase.gsub(/[^a-z0-9\s\--]/,'').split(' ')
end

def common_words ####the, or, and, of etc
  common_words =  File.read("stop_words.txt").split(' ')
end

all_words = word_array(input_file_name) ###puts an argument through the

word_count = Hash.new 0 ###creting a hash

common_words.each do |word|
  all_words.delete(word)
end


all_words.each do |add_count|
  word_count[add_count] += 1
end


ruby = word_count.sort_by { |key, value| value }.last(input_count).reverse

ruby.each do |key, value|
  puts key + ': ' + value.to_s
end
