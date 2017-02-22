# MASTERMIND Psuedo
# When the User runs mastermind.rb, starts by printing:
# "Welcome to MASTERMIND
# Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
#
# MASTERMIND waits for user input
gets
# MASTERMIND compairs user input to six options:
  # (p)lay
  # (i)nstructions
  # (q)uit
# If none of those options match, repeat:
#"Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
# and wait for user input again.

# If user input matches (i)nstructions, print string with short summary of how to play the MASTERMIND game.
  #"Welcome to MASTERMIND Instructions. MASTERMIND will randomly select a four character Secret Code. Your job is to guess that code! MASTERMIND will let you know if your guess is close, and how close.
# Would you like to (p)lay, or (q)uit?"
# Instructions end with another user input opportunity
gets
# followed by user input comparisons to choose the next stage.

# If user input matches (p)lay, proceed to GAME
# GAME records starting timestamp
# GAME establishes a Secret Code by pulling a random sample of   four letters from a stash of letter options.
  #likely an array, at least 4 of each? (or will sample just repeat sample from a smaller set? -- maybe enumerably sampling to map array)
    #look for in refactoring
# GAME prints "I have generated a beginner sequence with four elements made up of: (r)ed,
# (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
# What's your guess?"
# GAME waits for user input
gets
# Given input, GAME compairs input to a few quantities
  # Does input match (q)uit? Then Quit
  # Does input match (i)nstructions? Then print instructions
  # Does input match (c)heat? Then print out the current Secret Code.
  # If none of the above,
    # GAME adds 1 to the number of guesses taken
            #inremental counter
    # Does input match the correct answer? Move on to WIN
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


#EXTENSIONS
  #Difficulty
  #After the User inputs (p)lay, before starting the game print "Choose a level of difficulty: (B)eginner , (i)ntermediate, (a)dvanced"
  #All instances of "4" need an additional :: (multiply by difficulty) modifier Beginner = 1, Intermediate = 1.5, Advanced = 2
  # Some new interpolation will be required in messages
