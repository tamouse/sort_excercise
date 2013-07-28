require 'spec_helper'

module SortExercise
  
  describe SortExercise do

    it 'should have a version number' do
      SortExercise::VERSION.should_not be_nil
    end

  end
  
end

$implementations.each do |m|

  describe "Good cases #{m}" do

    [(1..7).to_a.shuffle,
     %w{now is the winter of our discount tent},
     [1],
     %w{z z z a h a i z w w},
     [],
    ].each do |ary|
      context "#{ary}" do

        it 'should sort by looping' do
          bary = m.loop_sort(ary)
          bary.should == ary.sort
          bary.object_id.should_not == ary.object_id
        end
      
        it 'should sort by recursing' do
          bary = m.recursive_sort(ary)
          bary.should == ary.sort
          bary.object_id.should_not == ary.object_id
        end
      end # context

    end # each
    
  end # describe


  describe "Bad cases #{m}" do

    it "should fail on non-arrays" do
      expect{m.loop_sort("a string")}.to raise_error
      expect{m.recursive_sort("a string")}.to raise_error
    end

    it "should fail on mixed arrays" do
      expect{m.loop_sort([1, "a", :b])}.to raise_exception ArgumentError
      expect{m.recursive_sort([1, "a", :b])}.to raise_exception ArgumentError
    end

  end
  
  
end

