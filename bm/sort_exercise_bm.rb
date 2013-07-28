require 'benchmark'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sort_exercise'


LIMIT = 1_000
TEST_DATA = {
  "in order"      => (1..100).to_a,
  "reverse order" => (1..100).to_a.reverse,
  "random order"  => (1..100).to_a.shuffle,
}

Benchmark.bmbm(60) do |x|
  TEST_DATA.each do |label, data|
    x.report("core sort: #{label}") {1.upto(LIMIT) {data.sort}}
  end
  
  [SortExercise::Insertion,
   SortExercise::Selection,
  ].each do |m|
    TEST_DATA.each do |label, data|
      x.report("#{m}.loop_sort: #{label}")      {1.upto(LIMIT) {m.loop_sort(data)}}
      x.report("#{m}.recursive_sort: #{label}") {1.upto(LIMIT) {m.recursive_sort(data)}}
    end
      
  end
end


