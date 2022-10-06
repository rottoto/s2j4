# frozen_string_literal: true

require_relative '../utils/string'

def sep
  puts '-' * 20
end

def answer(text)
  puts "--> #{text}".green
end

def question(text)
  sep
  puts text.magenta
  gets.chomp
end
