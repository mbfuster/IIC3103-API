require "http"
require "json"

class GreetingsController < ApplicationController
  def get_chapter
    @message = "Hello, how are you today?"
    body = HTTP.get("https://rickandmortyapi.com/api/episode").body
    results = JSON.parse(body)
    @results = results["results"]
    @length = @results.length

  end


end
