class Word < ActiveRecord::Base
  before_save :add_letters

  def add_letters
    characters = self.text.chars
    alphabetized_characters = characters.sort
    self.letters = alphabetized_characters.join
  end

  def self.find_anagrams(string)
    # Convert word to an array of letters
    array = string.downcase.split(//) #abc -> ["a", "b", "c"]

    #Find every letter permutation
    anagram = array.permutation.map {|i| i.join}

    correct_anagrams = []
    anagram.each do |combo|
      if Word.find_by_text(combo).present?
        correct_anagrams << combo
      end
    end

    correct_anagrams
  end

  def self.three_letters?(input)
    if input.length <= 3
      true
    else
      false
    end
  end

  def self.distinct_letters?(input)
    letter_array = input.chars
    unique_letters = letter_array.uniq
    if unique_letters.length < letter_array.length
      false
    else
      true
    end
  end

  def self.valid_input(input)
    if input.length > 3
      raise Exception.new("Word must be less than or equal to 3 characters.")
    elsif distinct_letters?(input) == false
      raise Exception.new("There are no anagrams for this word.")
    end
  end

end
