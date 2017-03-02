#psuedo


For each variable possibility in secret options (1-4 to 1-8)
  # start w/ hardcoding for each variable
  # next round dynamically count unique variables in Guess
    #form new checking array that counts instances of each of those variables in Guess
      #THEN compare them to the counts of instances in Secret
    if GVC[variable] > 0
      #v perfect v
      if GVC = SVC
        add GVC to number of correct elements count

      # v not there at all v
      elsif (-GVC) = (SVC-GVC)
        #stop checking it
      elsif GVC

      end

    end











    elsif GVC > SVC
      add (GVC - SVC) to number of correct elements count
    elsif GVC < SVC
