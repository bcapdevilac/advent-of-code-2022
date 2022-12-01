#!/usr/bin/env ruby

def raw_calories_by_elf
  @raw_calories_by_elf ||= File.read('input.txt').split("\n\n")
end

def calories_by_elf
  @calories_by_elf ||= raw_calories_by_elf.map do |raw_calories|
    raw_calories.split("\n").map(&:to_i).sum
  end
end

##########
# PART 1 #
##########

top_elf_calories = calories_by_elf.max
puts "top_elf_calories --> #{top_elf_calories}"

##########
# PART 2 #
##########

three_top_elves_calories = calories_by_elf.max(3).sum
puts "three_top_elves_calories --> #{three_top_elves_calories}"
