
#psuedo

http://jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/


For each variable possibility in secret options (1-4 to 1-8)
  # start w/ hardcoding for each variable
  # next round dynamically count unique variables in Guess
    #form new checking array that counts instances of each of those variables in Guess
      #THEN compare them to the counts of instances in Secret
      #For dynamic checking, can keep "advanced" array and run the enumerable checks on #difficulty (4,6,8)
easy = [A,B,C,D]  intermediate = [A,B,C,D,E,F]  advanced = [A,B,C,D,E,F,G,H]



secret = ['B','B','D','C']
guess = ['A','A','B','D']
#GVC & SVC will need to be methods that can be called upon within the element checker method
def element_checker
    @seed_array.each do |check_variable|

    if @guess.count(check_variable) > 0
      #v perfect v
      if @guess.count(check_variable) = @secret_code.count(check_variable)
         @correct_elements += @guess.count(check_variable)
      # v not there at all v
      elsif @secret_code.count(check_variable) = 0
        @correct_elements += 0
      elsif @guess.count(check_variable) > @secret_code.count(check_variable)
        @correct_elements += @secret_code.count(check_variable)
      else @guess.count(check_variable) < @secret_code.count(check_variable)
        @correct_elements += @guess.count(check_variable) 
      end
    end
end
