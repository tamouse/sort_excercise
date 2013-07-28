require 'spec_helper'

module SortExercise
  
  describe SortExercise do

    it 'should have a version number' do
      SortExercise::VERSION.should_not be_nil
    end

  end
  
end

[SortExercise::Insertion,
 SortExercise::Selection,
].each do |m|

  describe m do

    [(1..7).to_a.shuffle,
     %w{now is the winter of our discount tent}].each do |ary|
      context "#{ary}" do

        it 'should sort by looping' do
          bary = m.loop_sort(ary)
          bary.should == ary.sort
          bary.should_not === ary
        end
      
        it 'should sort by recursing' do
          bary = m.recursive_sort(ary)
          bary.should == ary.sort
          bary.should_not === ary
        end
      end # context

    end # each
    
  end # describe
  
end

