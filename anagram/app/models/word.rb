class Word

  def self.find_anagrams(string)
    # Convert word to an array of letters
    array = string.downcase.split(//) #abc -> ["a", "b", "c"]

    #Find every letter permutation
    anagram = array.permutation.map {|i| i.join}
    return anagram
  end

  def self.reverse_letters(letters)
    # create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)

    # loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end

    reversed_letters
  end
end
