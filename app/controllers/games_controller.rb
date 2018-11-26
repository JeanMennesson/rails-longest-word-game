require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      new_letter = ('a'..'z').to_a.sample
      @letters << new_letter
    end
  end

  def score
    @attempt = params[:word]
    @valid = @attempt.split(//).all? do |letter|
      @attempt.delete_at(@attempt.index(letter)) if @attempt.include?(letter)
    end
  end

  def english_word(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    english_word_serialized = open(url).read
    english_word_check = JSON.parse(english_word_serialized)
    english_word_check['found']
  end

  def run_games(attempt)

  end


end
