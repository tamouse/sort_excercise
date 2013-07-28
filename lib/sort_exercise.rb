require "sort_exercise/version"

# Implement in a module; always think in modules!
# We turn the methods into module methods by prepending "self." on the method name.

module SortExercise

  # Implement a simple insertion sort in a loop
  def self.loop_sort(a)
    # We go through the array to look at each element in it, with it's index
    a.each_with_index do |element, index|
      hole = (index - 1)        # this starts us looking for a hole
                                # for the element we're comparing  to
                                # fit into. 

      # Walk backwards through the array until we find the hole
      while hole >= 0
        break if a[hole] <= element #  We've found the insertion point 

        a[hole + 1] = a[hole]   # shift the array element up
        hole -= 1               # check the previous item
      end
      
      a[hole+1] = element       # stuff the element in the right place
      
    end
  end




  # A recursive implmentation of the same insertion sort
  # This method actually requires two levels of recursion:
  # * 1 for the outer "each" loop to go through the entire array
  # * 2 for the inner "while" loop to find the hole
  # recursive_sort fulfills the first need, while insert_into_hole
  # fulfills the second need.
  #
  # recursive sort is a public method, as it is what gets called from
  # the main program, and what we use to test with.
  #
  def self.recursive_sort(a,first=nil,last=nil)
    # The first time recursive_sort is called, the first and last
    # parameters are omitted, and get set at the beginning; this makes
    # calling the method a very clean "recursive_sort(my_array)".
    first = 0 if first.nil?
    last = a.size-1 if last.nil?


    if (first < last)
      recursive_sort(a, first, last-1) #  This gives us our "each" loop to run through the array
      self.insert_into_hole(a[last], a, first, last-1) # This starts
                                                       # off our
                                                       # "while" loop 
    end
    a                           # Return the now-sorted array
  end

  private

  # As mentioned above, insert_into_hole implements the inner "while"
  # loop for the insertion sort. It is declared private so it can't be
  # invoked inadvertently.
  def self.insert_into_hole(el, a, first, last)

    if (el >= a[last])
      # When this occurs, just set the next
      # slot in the array to the element.
      a[last+1] = el
    elsif (first < last)
      # This is our "while" recursion, shifting array elements up to
      # create a hole for the element we're inserting
      a[last+1] = a[last]
      insert_into_hole(el, a, first, last-1)
    else
      # This is the final condition when first is equal to last, and
      # we know we're at the point to insert the element.
      a[last+1] = a[last]
      a[last] = el
    end

    a                           # return the sorted array up to this point
  end

end
