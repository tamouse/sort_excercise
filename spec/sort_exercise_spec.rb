require 'spec_helper'

module SortExercise
  
  describe SortExercise do
    it 'should have a version number' do
      SortExercise::VERSION.should_not be_nil
    end

    it 'should sort by looping' do
      a = (1..7).to_a.shuffle
      SortExercise::loop_sort(a).should == a.sort
    end

    it 'should sort by recursing' do
      a = (1..7).to_a.shuffle
      SortExercise::recursive_sort(a).should == a.sort
    end
    
  end

end
