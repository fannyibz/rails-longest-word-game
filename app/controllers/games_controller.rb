require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)

  end

  def score
    try = params[:solution]
    url = "https://wagon-dictionary.herokuapp.com/#{try}"
    html_file = open(url).read
    @response = JSON.parse(html_file)
    @response["found"]
    if @response["found"] == true
        if try.chars.all? { |char| try.chars.count(char) <= params["letters"].split(" ").count(char)}
          @answer = "Congratulation #{try} is a valid word"
        else
          @answer = "Sorry but test can't be build out of #{params["letters"].split(" ").join(", ")}"
        end
    else
      @answer = "Sorry but #{try} does not seem to be a valid world"
    end

  end

end




