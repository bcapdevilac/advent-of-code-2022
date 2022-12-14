#!/usr/bin/env ruby

class Main
  LOWER_CASE_PRIORITIES = ('a'..'z').each_with_index.map { |l, i| [l, i + 1] }.freeze
  UPPER_CASE_PRIORITIES = ('A'..'Z').each_with_index.map { |l, i| [l, i + 1 + LOWER_CASE_PRIORITIES.size] }.freeze
  PRIORITIES = (LOWER_CASE_PRIORITIES + UPPER_CASE_PRIORITIES).to_h.freeze

  def initialize(file:)
    @rucksacks = File.read(file).split("\n")
  end

  def run
    puts "Total of rucksacks priorities: #{priorities.sum}"
  end

  private

  def priorities
    @rucksacks.map do |rucksack|
      first_compartiment, second_compartiment = *rucksack.chars.each_slice(rucksack.length / 2)
      common_item = (first_compartiment & second_compartiment).first
      PRIORITIES[common_item]
    end
  end
end

Main.new(file: 'input.txt').run
