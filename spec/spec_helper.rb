LIB_ROOT = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift LIB_ROOT
require 'sort_exercise'
require 'active_support'
require 'active_support/core_ext/string/inflections'

Dir.chdir(LIB_ROOT) do |pwd|
  $implementations = Dir['sort_exercise/*.rb'].map do |m|
    next if m =~ /skeleton/
    m.sub(/\.rb$/,'').camelize.constantize
  end.compact
end
