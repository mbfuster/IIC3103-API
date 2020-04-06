require "http"
require "json"

@episodes_requested = FALSE

class GreetingsController < ApplicationController
  def get_chapter
    @url = "https://integracion-rick-morty-api.herokuapp.com/api/"
    if !@episodes_requested
      body = HTTP.get(@url + "episode").body
      results = JSON.parse(body)
      episodes_pages = results["info"]["pages"]
      episode_results =  results["results"]
      if episodes_pages != 1
        i = 2
        while i <= episodes_pages
          request = @url + 'episode/?page=' +  i.to_s
          body = HTTP.get(request).body
          results = JSON.parse(body)
          j = 0
          while j < results["results"].length
            episode_results << results["results"][j]
            j += 1
          end
          i += 1
        end
      end
      @episode_results = episode_results
      @length = @episode_results.length
      #@episodes_requested = TRUE
    end

  end





end
