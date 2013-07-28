
module SortExercise

  # Selection sort is arguably the simplest sort of all, although it
  # can be expensive for large arrays.
  #
  # See https://en.wikipedia.org/wiki/Selection_sort for a description
  # of the algorithm used here.

  module Selection

    # NON-DESTRUCTIVE METHODS

    def self.loop_sort(a)
      self.loop_sort!(a.dup)
    end
    def self.recursive_sort(a)
      self.recursive_sort!(a.dup)
    end
    
    # DESTRUCTIVE METHODS

    # The iterative (non-recursive) implementation uses two loops, the
    # first to run through the entire array, the inner one to compare
    # values to find the index of the smallest value in the array.
    def self.loop_sort!(a)
      a.each_index do |outer_index|
        index_of_min = outer_index
        inner_index = outer_index + 1
        while (inner_index < a.size) do
          index_of_min = inner_index if a[inner_index] < a[index_of_min]
          inner_index += 1
          end
        a[outer_index], a[index_of_min] = a[index_of_min], a[outer_index] if outer_index != index_of_min
      end
      a
    end

    # Recursive Method
    #
    # Since we have two loops in the non-recursive implementation,
    # we'll need to have two recursions in the recursive
    # implementation.
    def self.recursive_sort!(a, outer_index=nil)
      outer_index = 0 if outer_index.nil?
      return if outer_index >= a.size
      index_of_min = self.locate_min(a, outer_index, outer_index+1)
      a[outer_index], a[index_of_min] = a[index_of_min], a[outer_index] if outer_index != index_of_min
      self.recursive_sort!(a, outer_index+1)
      a
    end

    private

    # Private helper method to return the index of the smallest value
    # in array a
    def self.locate_min(a, index_of_min, index)
      return index_of_min if index >= a.size
      index_of_min = index if a[index] < a[index_of_min]
      locate_min(a, index_of_min, index+1)
    end
    
  end
end
