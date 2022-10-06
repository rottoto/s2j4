# frozen_string_literal: true

require_relative '../data/cryptos'
require_relative 'qa'

def perform
  market = TOKENS.zip(VALUES.map(&:to_f)).to_h

  question "La ou les cryptos qui ont la plus grosse valeur."
  answer(market.select { |_k, v| v == market.values.max })

  question "La ou les cryptos qui ont la plus petite valuer."
  answer(market.select { |_k, v| v == market.values.min })

  question "Les devises dont le cours est inférieur à 6000"
  answer(market.select { |_k, v| v <= 6000 })

  question "La devise la plus chère parmi celles dont le cours est inférieur à 6000"
  answer(market.select { |_k, v| v <= 6000 }.max_by { |_k, v| v })
end

perform
