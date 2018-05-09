def reverse_letters(letters)
  length = letters.length
  reversed_letters = Array.new(length)

  letters.each_with_index do |letter, index|
    reversed_letters[length - index - 1] = letter
  end

  reversed_letters
end
