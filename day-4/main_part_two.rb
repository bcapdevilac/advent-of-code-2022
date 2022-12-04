#!/usr/bin/env ruby

def to_range(dash_range)
  first, last = dash_range.split('-').map(&:to_i)
  (first..last).to_a
end

def overlap?(arr1, arr2)
  (to_range(arr1) & to_range(arr2)).any?
end

elf_pairs = File.read('input.txt').split("\n")
pairs_with_overlap = elf_pairs.select do |elf_pair|
  first, second = elf_pair.split(',')
  overlap?(first, second)
end

puts "Pairs with overlap: #{pairs_with_overlap.size}"
