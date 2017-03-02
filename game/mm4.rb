require 'pry'
#MASTERMIND draft
# Finally adding beginnings of element checking for hints -- starting with one element type

# NEEDED REVISION ::: downcase all user input for easier ruby understanding




class OneBigClass
  attr_reader  :piq , :guess, :seed_array, :secret_code, :start_time, :finish_time, :attempts
#
# def guess
#   @guess
# end


  # guess #=> @guess #=> []

  def initialize
      @piq = ""
      @guess = []
      @start_time = ""
      @finish_time = ""
      @seed_array = ["r","g","b","y",]
      @attempts = 0
      @correct_elements = 0
      @secret_code = [""]  # consider hardcoding this to develop later methods and testing
      # @difficulty = will need method to gets user difficulty choice and change seed

      welcome
  end
enumerable
  r
  g
  b
  y
elementchecker(enumerable)
boolean
  # When the User runs mastermind.rb, starts by printing:
  # "Welcome to MASTERMIND
  # Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  # MASTERMIND waits for user input
  # vv DOWNCASE VV
  def welcome
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
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
      secret_code = map{seed_array.sample(4)}
      #tells user to guess
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
      # (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n What's your guess?"
      #aquires guess string and splits into array

      @guess = gets.chomp.split(//)

      guess_checker
  end

#how good is the guess? let's find out vvvv
#still would like option to quit here -- messy for now. maybe with more modulation
  def guess_checker
    # GAME adds 1 to the number of guesses taken
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
    # Winning, records new timestamp and subtracts old timestamp from it to attain time elapsed.
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



  def guess_instances_of_red
    if guess.count('r') > 0
      correct_element_counter
  end

  def secret_instances_of_red
    secret_code.count('r')
  end
    # For each variable possibility in secret options (1-4 to 1-8)
    #   # start w/ hardcoding for each variable
    #   # next round dynamically count unique variables in Guess
    #     #form new checking array that counts instances of each of those variables in Guess
    #       #THEN compare them to the counts of instances in Secret
    #       #For dynamic checking, can keep "advanced" array and run the enumerable checks on #difficulty (4,6,8)
    # easy = [A,B,C,D]  intermediate = [A,B,C,D,E,F]  advanced = [A,B,C,D,E,F,G,H]


    #GVC & SVC will need to be methods that can be called upon within the element checker method
    def correct_element_counter (guess_instances_of_red)
        correct_elements = []
        if guess_instances_of_red > 0
          #v perfect v
          if guess_instances_of_red = secret_instances_of_red
            number_of_correct_elements += guess_instances_of_red

          # v not there at all v
          elsif SVC = 0
            #stop checking it, not present
          elsif GVC > SVC
            add SVC to number of correct elements in count
          else GVC < SVC
            add GVC to number of correct elements in count
          end
        end
    end

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
