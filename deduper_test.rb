#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'benchmark'
require_relative 'deduper'

class DeduperTest < Minitest::Test
  def test_kept_in_same_order
    array = ["a", "c", "b", "c", "a", "d", "d", "a"]
    assert_equal ["a", "c", "b", "d"], Deduper.dedup(array)
  end

  def test_case_insensitive
    array = ["Ab", "aB", "Bbb"]
    assert_equal ["Ab", "Bbb"], Deduper.dedup(array)
  end

  def test_ignores_whitespace
    array = ["a", "a ", " a"]
    assert_equal ["a"], Deduper.dedup(array)
  end

  def test_speed
    array = File.readlines("test.txt", "\n") 
    time = Benchmark.realtime do
      Deduper.dedup(array)
    end

    assert time < 0.5
  end

  def test_large
    array = File.readlines("test.txt", "\n") 
    
    assert_equal array.uniq, Deduper.dedup(array)
  end
end