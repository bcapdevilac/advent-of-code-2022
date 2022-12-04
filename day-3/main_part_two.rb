#!/usr/bin/env ruby

class Main
  LOWER_CASE_PRIORITIES = ('a'..'z').each_with_index.map { |l, i| [l, i + 1] }.freeze
  UPPER_CASE_PRIORITIES = ('A'..'Z').each_with_index.map { |l, i| [l, i + 1 + LOWER_CASE_PRIORITIES.size] }.freeze
  PRIORITIES = (LOWER_CASE_PRIORITIES + UPPER_CASE_PRIORITIES).to_h.freeze

  GROUPS_OF = 3

  def initialize(file:)
    @rucksacks = File.read(file).split("\n")
  end

  def run
    puts "Total of group rucksack priorities: #{priorities.sum}"
  end

  private

  def elf_groups
    @rucksacks.each_slice(GROUPS_OF).to_a
  end

  def priorities
    elf_groups.map do |elf_group|
      first, second, third = elf_group.map(&:chars)
      badge = (first & second & third).first
      PRIORITIES[badge]
    end
  end
end

Main.new(file: 'input.txt').run
