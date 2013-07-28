require 'benchmark'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sort_exercise'


LIMIT = 1_000
TESTARRAY = 1.upto(100).to_a.shuffle

Benchmark.bm(50) do |x|
  x.report("core sort") {1.upto(LIMIT) {TESTARRAY.sort}}

  [SortExercise::Insertion,
   SortExercise::Selection,
  ].each do |m|
    x.report("#{m}.loop_sort") {1.upto(LIMIT) {m.loop_sort(TESTARRAY)}}
    x.report("#{m}.recursive_sort") {1.upto(LIMIT) {m.recursive_sort(TESTARRAY)}}
  end
end


