#!/usr/bin/env ruby

def full_overlap?(arr1, arr2)
  arr1_first, arr1_last = arr1.split('-')
  arr2_first, arr2_last = arr2.split('-')

  arr1_first.to_i <= arr2_first.to_i && arr1_last.to_i >= arr2_last.to_i
end

elf_paris = File.read('input.txt').split("\n")
pairs_with_full_overlap = elf_paris.select do |elf_pair|
  first, second = elf_pair.split(',')
  full_overlap?(first, second) || full_overlap?(second, first)
end

puts "Elf pairs with full overlap: #{pairs_with_full_overlap.size}"