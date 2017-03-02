require 'pry'
#MASTERMIND draft 1





class OneBigClass
  attr_reader  :piq , :guess, :seed_array, :secret_code, :start_time, :finish_time, :attempts
  def initialize
      @piq = ""
      @guess = []
      @start_time = ""
      @finish_time = ""
      @seed_array = ["r","g","b","y",]
      @attempts = 0
      @secret_code = [""]  # consider hardcoding this to develop later methods and testing
      # @difficulty = will need method to gets user difficulty choice and fill this in with multiplier

      welcome
  end


  # When the User runs mastermind.rb, starts by printing:
  # "Welcome to MASTERMIND
  # Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  # MASTERMIND waits for user input
  def welcome
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    piq = gets.chomp
    if piq == "play" || piq ==  "p" || piq == "(p)"
      setup
    elsif piq ==  "instructions" || piq == "i" || piq == "(i)"
      instructions
    elsif piq ==  "quit" || piq == "q" || piq == "(q)"
      quit
    else
      puts "Invalid entry"
      welcome

    end
  end
  #refactor with
  # case piq
  # when "play" || "(p)"
  #   setup
  # when
  #   instructions
  # end


  # If user input matches (i)nstructions, print string with short summary of how to play the MASTERMIND game.
    #"Welcome to MASTERMIND Instructions. MASTERMIND will randomly select a four character Secret Code. Your job is to guess that code! MASTERMIND will let you know if your guess is close, and how close.
  # Would you like to (p)lay, or (q)uit?"
  # Instructions end with another user input opportunity
  # gets
  # followed by user input comparisons to choose the next stage.
  def instructions
    puts "Welcome to MASTERMIND Instructions. MASTERMIND will randomly select a four character Secret Code. Your job is to guess that code! MASTERMIND will let you know if your guess is close, and how close.\n Would you like to (p)lay, or (q)uit?"
    piq = gets.chomp
    if piq == "play" || piq ==  "p" || piq == "(p)"
      setup
    elsif piq ==  "instructions" || piq == "i" || piq == "(i)"
      instructions
    elsif piq ==  "quit" || piq == "q" || piq == "(q)"
      quit
    else
      puts "Invalid entry"
      welcome
    end
  end

  # If user input matches (p)lay, proceed to setup method
  def setup
      # setup records starting timestamp
      start_time = Time.new
      # creates a super secret code from the seed array
      secret_code = 4.times.map{seed_array.sample}
      #tells user to guess
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
      # (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n What's your guess?"
      #aquires guess string and splits into array

      @guess = gets.chomp.split(//)

      guess_checker
  end

#how good is the guess? let's find out vvvv
  def guess_checker
    @attempts += 1
    # Does input match the correct answer? Move on to WIN
    if @guess == @secret_code
      win
    if @guess == nil
      puts "Invalid guess."
    elsif @guess.count <= 3
      puts "Your guess is not enough characters."   #refactor ** maybe interpolate with difficulty multiplier "enter this many"
    elsif @guess.count >= 5
      puts "Your guess is too many characters."
    else
      

  end

  def win
    finish_time = Time.new
    # vv this Time formatting is junky, look into cleanup
    puts "Congratulations! You guessed the secret code #{@secret_code} in #{@attempts} guesses over #{@start_time - @finish_time}.\nDo you want to (p)lay again or (q)uit?"
    piq = gets.chomp
    if piq == "play" || piq ==  "p" || piq == "(p)"
      setup
    elsif piq ==  "quit" || piq == "q" || piq == "(q)"
      quit
    else
      puts "Invalid entry"
      welcome
  end

# Given input, GAME compairs input to a few quantities
  # Does input match (q)uit? Then Quit
  # Does input match (i)nstructions? Then print instructions
  # Does input match (c)heat? Then print out the current Secret Code.
  # If none of the above,
    # GAME adds 1 to the number of guesses taken
            #inremental counter
    # If it's none of those, GAME looks more closely:
      # Is the input longer than 4 characters? Then print "Your answer has too many characters"
      # Is the input short than 4 characters? Then print "Your answer does not have enough characters"
      # If input is 4 characters and does not match the Secret Code
        # Count the number of items in Guess that are the same items as Secret Code, prints "you have this many correct letters"
          #Check Secret Code against Guess, not Guess against Secret Code
            # Enumerables and recursion likely here
            #instance of SC[0]? which G[?] check against eliminatively to get number "right"
          #if some of them are in the correct place
            # Count the number of correct items in the correct place "You have this many correct letters in this many correct places"
# When the user Guesses correctly, WIN.
# Winning, records new timestamp and subtracts old timestamp from it to attain time elapsed.
# Winning Prints "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
# 22 seconds.  **<-- plenty of interpolation**
# Do you want to (p)lay again or (q)uit? "
#

# quit

  def quit
    abort("Thank you!")
  end

#
end
# #^end of class^
#

OneBigClass.new


#EXTENSIONS
  #Difficulty
  #After the User inputs (p)lay, before starting the game print "Choose a level of difficulty: (B)eginner , (i)ntermediate, (a)dvanced"
  #All instances of "4" need an additional :: (multiply by difficulty) modifier Beginner = 1, Intermediate = 1.5, Advanced = 2
  # Some new interpolation will be required in messages
