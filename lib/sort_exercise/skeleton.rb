
module SortExercise
  module Selection
    def self.loop_sort(a)
      self.loop_sort!(a.dup)
    end
    def self.recursive_sort(a)
      self.recursive_sort!(a.dup)
    end
    def self.loop_sort!(a)
      a
    end
    def self.recursive_sort!(a)
      a
    end
  end
end
