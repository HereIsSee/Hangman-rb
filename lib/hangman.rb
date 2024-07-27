
class Hangman

  def initialize

  end

  def select_secret_word array_of_words
    loop do
      index = rand(0...array_of_words.length)
      if array_of_words[index].length >= 5 && array_of_words[index].length <=12
        return array_of_words[index]
      end
    end
  end

 

end
def read_from_file string
  File.read(string).split(" ")
end
p Hangman.new.select_secret_word( read_from_file("words.txt") )