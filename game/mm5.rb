require 'pry'
#MASTERMIND draft
#Enum for element checker in place
#Enum for position checker needed
# some cleanup started


class OneBigClass
  attr_reader  :player_choice , :guess, :formatted_guess, :seed_array, :secret_code, :start_time, :finish_time, :attempts
  def initialize
      @player_choice = ""
      @guess = []
      @seed_array = ["r","g","b","y",]
      # for difficulty may be easier to just have 3 diff seed arrays (w/ 6 & 8 variables). would also need to adjust sample (4)- be careful element_checker method
      @attempts = 0
      @correct_elements = 0
      @correct_positions = 0
      @secret_code = []
      @start_time = ""
      @finish_time = ""
      @formatted_guess
      welcome
  end

  def welcome
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    player_choice = gets.chomp.downcase
    if player_choice == "play" || player_choice ==  "p" || player_choice == "(p)"
      play
    elsif player_choice ==  "instructions" || player_choice == "i" || player_choice == "(i)"
      instructions
    elsif player_choice ==  "quit" || player_choice == "q" || player_choice == "(q)"
      quit
    else
      puts "Invalid entry"
      welcome
    end
  end

  def instructions
    puts "Welcome to MASTERMIND Instructions. MASTERMIND will randomly select a four character Secret Code. Your job is to guess that code! MASTERMIND will let you know if your guess is close, and how close.\n Would you like to (p)lay, or (q)uit?"
    player_choice = gets.chomp.downcase
    if player_choice == "play" || player_choice ==  "p" || player_choice == "(p)"
      play
    elsif player_choice ==  "instructions" || player_choice == "i" || player_choice == "(i)"
      instructions
    elsif player_choice ==  "quit" || player_choice == "q" || player_choice == "(q)"
      quit
    else
      puts "Invalid entry"
      welcome
    end
  end

  def play
    start_time = Time.new
    # creates a super secret code from the seed array
    @secret_code = seed_array.sample(4).flatten

    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    # (g)reen, (b)lue, and (y)ellow.\n What's your guess?"

    guess << gets.chomp.downcase.split(//)
    @formatted_guess = guess.flatten

    guess_checker(formatted_guess)
  end

#is it a valid guess?
  def guess_checker(formatted_guess)
    @attempts += 1
    correct_elements = 0
    correct_positions = 0
    if formatted_guess == secret_code
      win
    elsif formatted_guess ==  "quit" || formatted_guess == "q" || formatted_guess == "(q)"
      quit
    elsif formatted_guess.count == 4
      guess_feedback
    else
      puts "Invalid guess."
      play
    end

  end

  def element_checker
      seed_array.each do |check_variable|

      if formatted_guess.count(check_variable) > 0
        #v perfect v
        if formatted_guess.count(check_variable) == secret_code.count(check_variable)
           @correct_elements += @guess.count(check_variable)
        # v not there at all v
        elsif secret_code.count(check_variable) == 0
          correct_elements
          # v more in guess v
        elsif formatted_guess.count(check_variable) > secret_code.count(check_variable)
          @correct_elements += @secret_code.count(check_variable)
          # v more in secret v
        elsif formatted_guess.count(check_variable) < secret_code.count(check_variable)
          @correct_elements += @formatted_guess.count(check_variable)
        else
          correct_elements
        end
      end
    end
      guess_feedback
  end

#element position checker should probably be a 2 argument enum... would make dynamic scaling for difficulty easier
  def element_position_checker
    zipped_comparison = secret.zip(formatted_guess).flatten
    if zipped_comparison[0] == zipped_comparison[1]
      correct_positions += 1
    end
    if zipped_comparison[2] == zipped_comparison[3]
      correct_positions += 1
    end
    if zipped_comparison[4] == zipped_comparison[5]
      correct_positions += 1
    end
    if zipped_comparison[5] == zipped_comparison[6]
      correct_positions += 1
    end
  end

  def guess_feedback
    element_checker
    element_position_checker
    puts "You have #{@correct_elements} correct elements in #{@correct_positions} correct positions, keep trying!"
    guess = gets.chomp.downcase.split(//)
  end

  def win
    time_taken= start_time - Time.new
    # Winning, records new timestamp and subtracts old timestamp from it to attain time elapsed.
    # vv this Time formatting is junky, look into cleanup
    puts "Congratulations! You guessed the secret code #{secret_code} in #{attempts} guesses over #{time_taken.to_i} seconds.\nDo you want to (p)lay again or (q)uit?"
    player_choice = gets.chomp.downcase
    if player_choice == "play" || player_choice ==  "p" || player_choice == "(p)"
      play
    elsif player_choice ==  "quit" || player_choice == "q" || player_choice == "(q)"
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
# #^end of class^
OneBigClass.new
