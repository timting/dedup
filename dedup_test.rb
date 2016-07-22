#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'benchmark'
require_relative 'dedup'

class DedupTest < Minitest::Test
  def test_kept_in_same_order
    array = ["a", "c", "b", "c", "a", "d", "d", "a"]
    assert_equal ["a", "c", "b", "d"], Dedup.dedup(array)
  end

  def test_case_insensitive
    array = ["Ab", "aB", "Bbb"]
    assert_equal ["Ab", "Bbb"], Dedup.dedup(array)
  end

  def test_speed
    array = File.readlines("test.txt", "\n") 
    time = Benchmark.realtime do
      Dedup.dedup(array)
    end

    assert time < 0.5
  end
end