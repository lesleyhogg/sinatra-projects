#require_relative 'reverse_letters'

puts "Give me a three-letter word."
word = gets.chomp.downcase

def find_anagram(word)
  if word.length == 3
    array = word.split(//) #abc -> ["a", "b", "c"]
    anagram = array.permutation.map {|i| i.join}
    return anagram
  else
    puts "That is not a three-letter word!"
  end
end

=begin #This is the Skillcrush suggested solution
def find_anagram(word)
  length = word.length

  #Make the letters an array
  word = word.split("")

  anagrams = []

  word.each_with_index do |letter, index|
    remaining_letters = word.select { |l| l != letter}
    anagrams << letter + remaining_letters.join

    anagrams << letter + reverse_letters(remaining_letters).join
  end

  anagrams
end
=end
