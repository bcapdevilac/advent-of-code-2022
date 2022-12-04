#!/usr/bin/env ruby

def to_range(dash_range)
  first, last = dash_range.split('-').map(&:to_i)
  (first..last).to_a
end

def full_overlap?(arr1, arr2)
  (to_range(arr1) - to_range(arr2)).empty?
end

elf_pairs = File.read('input.txt').split("\n")
pairs_with_full_overlap = elf_pairs.select do |elf_pair|
  first, second = elf_pair.split(',')
  full_overlap?(first, second) || full_overlap?(second, first)
end

puts "Elf pairs with full overlap: #{pairs_with_full_overlap.size}"
