#!/usr/bin/env ruby

class Main
  def initialize(file:)
    @elf_pairs = File.read(file).split("\n")
  end

  def run
    puts "Pairs with overlap: #{pairs_with_overlap.size}"
  end

  private

  def to_range(dash_range)
    first, last = dash_range.split('-').map(&:to_i)
    (first..last).to_a
  end

  def overlap?(arr1, arr2)
    (to_range(arr1) & to_range(arr2)).any?
  end

  def pairs_with_overlap
    @elf_pairs.select do |elf_pair|
      first, second = elf_pair.split(',')
      overlap?(first, second)
    end
  end
end

Main.new(file: 'input.txt').run
