require "sort_exercise/version"

module SortExercise

  # Implement a simple insertion sort in a loop
  def self.loop_sort(a)
    a.each_with_index do |element, index|
      hole = (index - 1)
      # Walk backwards through the array until we find the hole
      while hole >= 0
        break if a[hole] <= element
        a[hole + 1] = a[hole]
        hole -= 1
      end
      a[hole+1] = element
    end
  end

  def self.recursive_sort(a,first=nil,last=nil)
    first = 0 if first.nil?
    last = a.size if last.nil?
    if (first < last)
      recursive_sort(a, first, last-1)
      self.insert_in_order(a.last, a, first, last-1)
    end
    a
  end

  def self.verify_sort(a)
    a == a.sort
  end

  private

  def self.insert_in_order(el, a, first, last)
    if (el >= a[last])
      a[last+1] = el
    elsif (first < last)
      a[last+1] = a[last]
      insert_in_order(el, a, first, last-1)
    else
      a[last+1] = a[last]
      a[last] = el
    end
    a
  end

end
