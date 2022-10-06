# frozen_string_literal: true

require_relative 'string'

# display in terminal a distribution in a fancy way
class DistributionDisplay
  attr_reader :distribution

  def initialize(distribution)
    @distribution = distribution
  end

  def display
    p = plot
    puts p[1..]
    puts p[0]
  end

  private

  def plot
    table = Array.new(y_range + 1) { '' }
    (y_range).times do |row|
      (distribution.keys.max + 1).times do |k|
        empty = row % 5 == 0 && row > 0 ? "---" : "   "
        empty = "#{"%02d" % row}|" if k == 0 && row % 5 == 0 && row > 0
        table[row] += empty if distribution[k] < row + 1

        cell = k % 2 == 0 ? "   ".bg_blue : "   ".bg_green
        table[row] += cell if distribution[k] >= row + 1
      end
    end
    (distribution.keys.max + 1).times do |k|
      table[-1] += "|#{"%02d" % k}"
    end
    table.reverse
  end

  def y_range
    distribution.values.max - distribution.values.min
  end

  def x_range
    distribution.keys.max - distribution.keys.min
  end

end
