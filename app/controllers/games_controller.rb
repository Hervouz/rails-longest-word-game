require 'open-uri'
require 'json'


class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
  @zulu = params[:caca].split("")
  @answer = params[:word].split("")

    if !(@answer - @zulu == [])
      @result = "Sorry but #{@answer.join.upcase} can't be built out of #{@zulu.join(", ").upcase}."
    elsif parsing(@answer.join) == false
      @result = "Sorry but #{@answer.join.upcase} does not seem to be
      an English word"
    else
      @result ="Congratulations! #{@answer.join.upcase} is a valid word"
    end
  end

  def parsing(answer)
    answer = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    result_serialized = open(url).read
    result_hash = JSON.parse(result_serialized)
    result_hash["found"]
  end

end
