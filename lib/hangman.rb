
class Hangman

  def initialize
    @guess_counter = 10
    @secret_word = select_secret_word( read_from_file("words.txt") )
    @guesed_word = "_" * @secret_word.length
    @already_guessed_letters = Array.new
  end

  def select_secret_word array_of_words
    loop do
      index = rand(0...array_of_words.length)
      if array_of_words[index].length >= 5 && array_of_words[index].length <=12
        return array_of_words[index]
      end
    end
  end

  def guess_letter
    puts "You have #{@guess_counter} guesses left"
    puts "Guess letter:"
    
    loop do
      guessed_letter = gets.chomp

      if guessed_letter.length != 1 || !guessed_letter.match?(/[[:alpha:]]/)
        puts "Incorrect input, try again!"
      elsif @already_guessed_letters.include?(guessed_letter)
        puts "You have already guessed this letter!"
      else
        @already_guessed_letters.push guessed_letter
        return guessed_letter
      end

    end
    
  end

end

def read_from_file string
  File.read(string).split(" ")
end

var = Hangman.new()

var.guess_letter
var.guess_letter