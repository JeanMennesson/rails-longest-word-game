class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      new_letter = ('a'..'z').to_a.sample
      @letters << new_letter
    end
  end

  def score
  end
end
