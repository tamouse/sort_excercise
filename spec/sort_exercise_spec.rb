require 'spec_helper'

module SortExercise
  
  describe SortExercise do

    it 'should have a version number' do
      SortExercise::VERSION.should_not be_nil
    end

    context "numeric array" do
      let(:a) {(1..7).to_a.shuffle}

      it 'should sort by looping' do
        SortExercise::verify_sort(SortExercise::loop_sort(a)).should be_true
      end
      
      it 'should sort by recursing' do
        SortExercise::verify_sort(SortExercise::recursive_sort(a)).should be_true
      end
    end

    context "string array" do
      let(:b) {%w{now is the winter of our discount tent}.shuffle}

      it 'should sort by looping' do
        SortExercise::verify_sort(SortExercise::loop_sort(b)).should be_true
      end
      
      it 'should sort by recursing' do
        SortExercise::verify_sort(SortExercise::recursive_sort(b)).should be_true
      end
    end
  end

end
