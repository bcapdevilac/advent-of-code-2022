#!/usr/bin/env ruby

class Main
  def initialize(file:)
    @elf_pairs = File.read(file).split("\n")
  end

  def run
    puts "Elf pairs with full overlap: #{pairs_with_full_overlap.size}"
  end

  private

  def to_range(dash_range)
    first, last = dash_range.split('-').map(&:to_i)
    (first..last).to_a
  end

  def full_overlap?(arr1, arr2)
    (to_range(arr1) - to_range(arr2)).empty?
  end

  def pairs_with_full_overlap
    @elf_pairs.select do |elf_pair|
      first, second = elf_pair.split(',')
      full_overlap?(first, second) || full_overlap?(second, first)
    end
  end
end

Main.new(file: 'input.txt').run
