#!/usr/bin/env ruby

LOWER_CASE_PRIORITIES = ('a'..'z').each_with_index.map { |l, i| [l, i + 1] }.freeze
UPPER_CASE_PRIORITIES = ('A'..'Z').each_with_index.map { |l, i| [l, i + 1 + LOWER_CASE_PRIORITIES.size] }.freeze
PRIORITIES = (LOWER_CASE_PRIORITIES + UPPER_CASE_PRIORITIES).to_h.freeze

rucksacks = File.read('input.txt').split("\n")
elf_groups = *rucksacks.each_slice(3)
priorities = elf_groups.map do |elf_group|
  first, second, third = elf_group.map(&:chars)
  badge = (first & second & third).first
  PRIORITIES[badge]
end

puts "Total of group rucksack priorities: #{priorities.sum}"
