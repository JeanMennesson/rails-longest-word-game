require 'open-uri'
require 'json'

class GamesController < ApplicationController
  # before_action :
  def new
    @letters = []
    10.times do
      new_letter = ('a'..'z').to_a.sample
      @letters << new_letter
    end
  end

  def score
    attempt = params[:word]
    if valid?(attempt) == false
      return "Sorry but #{attempt} can't be build out of #{@letters}"
    elsif english_word(attempt) == false
      return "Sorry but #{attempt} is not a valid English word ..."
    else
      return "Congratulations ! #{attempt} is a valid English word ! "
    end
  end

  def english_word(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    english_word_serialized = open(url).read
    english_word_check = JSON.parse(english_word_serialized)
    english_word_check['found']
  end

  def valid?(attempt)
    array = params[:letters].split(',')
    valid = attempt.split(//).all? do |letter|
      array.delete_at(array.index(letter)) if array.include?(letter)
    end
    valid
  end
end
