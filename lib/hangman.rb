require 'json'

class Hangman

  def initialize(
    guess_counter = 20, secret_word = select_secret_word( read_from_file("words.txt") ),
    guessed_word = ("_" * secret_word.length).split("").join(" "), already_guessed_letters = Array.new
    )
    @guess_counter = guess_counter
    @secret_word = secret_word
    @guessed_word = guessed_word
    @already_guessed_letters = already_guessed_letters
    @secret_word = secret_word.gsub(/\s+/, "").split("").join(" ")
  end

  def select_secret_word array_of_words
    loop do
      index = rand(0...array_of_words.length)
      if array_of_words[index].length >= 5 && array_of_words[index].length <=12
        return array_of_words[index]
      end
    end
  end

  def play

    "Do you want to start a new game or play a saved game?(new/save)"
    

    loop do

      # puts "Do you want to save the game and leave?"
      # anwser = gets.chomp
      # if()

      puts "You have #{@guess_counter} guesses left"
      puts @guessed_word

      update_hangman(guess_letter)
      @guess_counter-= 1

      p @secret_word
      puts @guessed_word

      if win?
        puts "You win!"
        puts @guessed_word
        break
      end

      if lose?
        puts "You ran out of guesses! You lose!"
        puts @guessed_word
        puts @secret_word
        break
      end
    end
  end

  def to_json
    JSON.dump ({

    })
  end

  def update_hangman letter
    @secret_word.chars.each_with_index do |element, index|
      @guessed_word[index] = element if element == letter && element != ' '
    end
  end

  def win?
    @guessed_word == @secret_word
  end

  def lose?
    @guess_counter <= 0
  end

  def guess_letter
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

var = Hangman.new().play


# puts "Do you want to play 'Hangman' again?(yes/no)"
#       anwser = gets.chomp
#       if anwser == 'no' || anwser == 'n'
#         break
#       end