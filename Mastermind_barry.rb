require 'pry'

class OneBigClass
  attr_reader  :player_choice , :guess, :seed_array, :secret_code, :start_time, :finish_time, :attempts
  def initialize
      @player_choice = ""
      @guess = []
      @seed_array 
      # for difficulty may be easier to just have 3 diff seed arrays (w/ 6 & 8 variables). would also need to adjust sample (4)- be careful element_checker method
      @attempts = 0
      @correct_elements = 0
      @correct_positions = 0
      @secret_code = []
      @start_time = ""
      @finish_time = ""
      welcome
  end

  def welcome
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    player_choice = gets.chomp.downcase
    if player_choice.include?("p")
      play
    elsif player_choice.include?("i")
      instructions
    elsif player_choice.include?("q")
      quit
    else
      puts "Invalid entry"
      welcome
    end
  end

  def instructions
    puts "Welcome to MASTERMIND Instructions. MASTERMIND will randomly select a four character Secret Code. Your job is to guess that code! MASTERMIND will let you know if your guess is close, and how close.\n Would you like to (p)lay, or (q)uit?"
    player_choice = gets.chomp.downcase
    if guess.join.include?("p")
      play
    elsif guess.join.include?("i")
      instructions
    elsif guess.join.include?("q")
      quit
    else
      puts "Invalid entry"
      welcome
    end
  end

  def play
    @secret_code = seed_array.sample(4).flatten
    start_time = Time.new
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    # (g)reen, (b)lue, and (y)ellow."

    @guess = gets.chomp.downcase.split(//)

    guess_checker
  end

  def filter
    puts "What's your next guess?"
    @guess = gets.chomp.downcase.split(//)
    guess_checker
  end

  def guess_checker
    binding.pry

    @attempts += 1
    correct_elements = 0
    correct_positions = 0
    if guess == secret_code
      win
    elsif guess.join.include?("q")
      quit
    elsif guess.length == 4
      guess_feedback
    else
      puts "Invalid guess."
      filter
    end

  end

  def element_checker
      @seed_array.each do |check_variable|

      if @guess.count(check_variable) > 0
        #v perfect v
        if @guess.count(check_variable) == @secret_code.count(check_variable)
           @correct_elements += @guess.count(check_variable)
        # v not there at all v
        elsif @secret_code.count(check_variable) == 0
          @correct_elements
          # v more in guess v
        elsif @guess.count(check_variable) > @secret_code.count(check_variable)
          @correct_elements += @secret_code.count(check_variable)
          # v more in secret v
        elsif @guess.count(check_variable) < @secret_code.count(check_variable)
          @correct_elements += @guess.count(check_variable)
        else
          @correct_elements
        end
      else
      @correct_elements
      end
    end
  end

#element position checker should probably be a 2 argument enum... would make dynamic scaling for difficulty easier
  def element_position_checker
    zipped_comparison = secret_code.zip(guess).flatten
    if zipped_comparison[0] == zipped_comparison[1]
      @correct_positions += 1
    end
    if zipped_comparison[2] == zipped_comparison[3]
      @correct_positions += 1
    end
    if zipped_comparison[4] == zipped_comparison[5]
      @correct_positions += 1
    end
    if zipped_comparison[5] == zipped_comparison[6]
      @correct_positions += 1
    end
  end

  def guess_feedback
    element_checker
    element_position_checker
    puts "You have #{@correct_elements} correct elements in #{@correct_positions} correct positions, keep trying!"

    filter
  end

  def win
    time_taken= start_time - Time.new
    # Winning, records new timestamp and subtracts old timestamp from it to attain time elapsed.
    # vv this Time formatting is junky, look into cleanup
    puts "Congratulations! You guessed the secret code #{secret_code} in #{attempts} guesses over #{time_taken.to_i} seconds.\nDo you want to (p)lay again or (q)uit?"
    player_choice = gets.chomp.downcase
    if guess.join.include?("p")
      play
    elsif guess.join.include?("q")
      quit
    else
      puts "Invalid entry"
      welcome
    end
  end



  def quit
    abort("Thank you!")
  end
end
OneBigClass.new
