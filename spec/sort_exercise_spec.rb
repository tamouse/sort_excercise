require 'spec_helper'

module SortExercise
  
  describe SortExercise do
    let(:a) {(1..7).to_a.shuffle}

    it 'should have a version number' do
      SortExercise::VERSION.should_not be_nil
    end

    it 'should sort by looping' do
      SortExercise::verify_sort(SortExercise::loop_sort(a)).should be_true
    end

    it 'should sort by recursing' do
      SortExercise::verify_sort(SortExercise::recursive_sort(a)).should be_true
    end
    
  end

end
