#!/usr/bin/env ruby

class Main
  MARKER_SIZE = 14

  def initialize(file:)
    @chars = File.read(file).chars
  end

  def run
    marker = (0..last_marker_start).each do |marker_start|
      marker = marker_start + MARKER_SIZE
      substring = @chars[marker_start...marker]

      break marker if marker?(substring)
    end

    puts "Start-of-packet marker: #{marker}"
  end

  private

  def marker?(substring)
    substring.uniq.size == substring.size
  end

  def last_marker_start
    @chars.size - MARKER_SIZE - 1
  end
end

Main.new(file: 'input.txt').run
