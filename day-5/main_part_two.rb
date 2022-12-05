#!/usr/bin/env ruby

require 'pry'

class Main
  INSTRUCTION_REGEX = /move\s(\d+)\sfrom\s(\d+)\sto\s(\d+)/.freeze
  STACK_REGEX = /\d+/.freeze

  def initialize(file:)
    @file = File.read(file).split("\n\n")
    @stacks = initial_stacks
  end

  def run
    follow_instructions!

    puts "Cranes at the top: #{cranes_at_the_top.join}"
  end

  private

  def initial_stacks
    @file.first
         .split("\n")
         .map(&:chars)
         .transpose
         .select { |s| stack?(s) }
         .to_h { |s| stack(s) }
  end

  def instructions
    @instructions ||= @file.last.split("\n").map do |instruction|
      count, from, to = instruction.match(INSTRUCTION_REGEX).captures.map(&:to_i)
      { count: count, from: from, to: to }
    end
  end

  def follow_instructions!
    instructions.each do |instruction|
      crane = @stacks[instruction[:from]].shift(instruction[:count])
      @stacks[instruction[:to]].unshift(*crane)
    end
  end

  def cranes_at_the_top
    @stacks.map { |_stack, cranes| cranes.first }
  end

  def stack?(raw_stack)
    raw_stack.any? { |e| STACK_REGEX.match(e) }
  end

  def stack(raw_stack)
    *contents, number = raw_stack
    contents.delete(' ')
    [number.to_i, contents]
  end
end

Main.new(file: 'input.txt').run
