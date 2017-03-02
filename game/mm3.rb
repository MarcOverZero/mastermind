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


  def guess_content
    items_correct = 0
    zipped = @secret_code.zip(@guess).flatten
    guess_item_a = zipped.count(zipped[1])
    guess_item_b = zipped.count(zipped[3])
    guess_item_c = zipped.count(zipped[5])
    guess_item_d = zipped.count(zipped[7])
    if guess_item_a %2 == 0
      items_correct += 1
    end
    if guess_item_b %2 == 0
      items_correct += 1
    end
    if guess_item_c %2 == 0
      items_correct += 1
    end
    if guess_item_d %2 == 0
      items_correct += 1
    end



############################################
    # Close but not correct sequence:
    # compare guess array[0]
      # If input is 4 characters and does not match the Secret Code
        # Count the number of items in Guess that are the same items as Secret Code, prints "you have this many correct letters"
          #Check Secret Code against Guess, not Guess against Secret Code
            # Enumerables and recursion likely here
            #instance of SC[0]? which G[?] check against eliminatively to get number "right"
          #if some of them are in the correct place
            # Count the number of correct items in the correct place "You have this many correct letters in this many correct places"

#sequence matching testing
s = ['a','a','a','d']
 s.count(s[0])
 

g = ['a','a','a','a']



b = ['1','2','3','4']
f = ['b','b','c','a']


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
