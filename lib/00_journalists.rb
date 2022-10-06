# frozen_string_literal: true

require_relative '../data/handles'
require_relative 'qa'
require_relative '../utils/distribution_display'

def perform
  question "Combien y a-t-il de handles dans cete array ?"
  answer HANDLES.size

  question "Quel est le handle le plus court de cette liste ?"
  answer HANDLES.min_by(&:size)

  question "Combien y a-t-il de handles contenant 5 caractères ?"
  answer HANDLES.select { |h| h.tr('@', '').size == 5 }.size

  question "Combien commencent par une majuscule ?"
  answer HANDLES.select { |h| h[1].between?('A', 'Z') }.size

  question "Trier la liste par ordre alphabétique"
  answer HANDLES.sort_by { |h| h.downcase }[0..10]

  question "Trier la liste par la taille des handles"
  answer HANDLES.sort_by(&:size)[0..10]

  question "Quelle est la position dans l'array de la personne @epenser ?"
  answer HANDLES.index('@epenser')

  question "Sors-moi une répartition des handles par taille de ces derniers"

  distribution = Hash.new(0)
  HANDLES.each do |h|
    distribution[h.size] += 1
  end

  answer distribution.sort.to_h

  DistributionDisplay.new(distribution).display

end

perform
