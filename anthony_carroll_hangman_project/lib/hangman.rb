class Hangman
  # class constant
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]



  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end
    false
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, idx|
      if ele == char
        arr << idx
      end
    end
    arr
  end

  def fill_indices(char, arr)
    arr.each do |indice|
      @guess_word[indice] = char
    end

  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    end
    @attempted_chars << char

    if get_matching_indices(char) == []
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, get_matching_indices(char))
    end
    true
  end


  def ask_user_for_guess
    p "Enter a char:"
    attempt = gets.chomp
    try_guess(attempt)
  end
  
  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win?
      p @secret_word
      return true
    elsif lose?
      p @secret_word
      return true
    end

    false
  end

  







end

