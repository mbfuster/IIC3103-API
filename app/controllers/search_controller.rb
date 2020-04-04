class SearchController < ApplicationController
  def show
  end

  def searches
    @search = params[:search]
    request_ep = "https://rickandmortyapi.com/api/episode/?name="+ @search.to_s
    body_ep = HTTP.get(request_ep).body
    results_episodes = JSON.parse(body_ep)
    @results_episodes = []
    @found_ep = TRUE
    if results_episodes["error"]
      @found_ep = FALSE
    else
      page_counter = 1
      results_episodes["results"].each do |rep|
        aux = [rep["id"],rep["name"]]
        @results_episodes << aux
      end

      next_p = results_episodes["info"]["next"]
      while next_p && results_episodes["info"]["pages"] != 1 && page_counter <= results_episodes["info"]["pages"] do
        request_ep = next_p.to_s
        body_ep = HTTP.get(request_ep).body
        r = JSON.parse(body_ep)
        r["results"].each do |rep|
          aux = [rep["id"],rep["name"]]
          @results_episodes << aux
        end
        next_p = r["info"]["next"]
      end
    end

##########################################personajes#####################################################

    request_ch = "https://rickandmortyapi.com/api/character/?name="+ @search.to_s
    body_ch = HTTP.get(request_ch).body
    results_characters = JSON.parse(body_ch)
    puts "------------------------------------------------------------------------"

    puts results_characters["info"]["next"]
    @results_characters = []
    @found_ch = TRUE
    if results_characters["error"]
      @found_ch = FALSE
    else
      page_counter = 1
      results_characters["results"].each do |rch|
        aux = [rch["id"],rch["name"]]
        @results_characters << aux
      end
      next_p =  results_characters["info"]["next"].to_s
      puts "------------------------------------------------------------------------"

      puts next_p
      puts "------------------------------------------------------------------------"

      while next_p && results_characters["info"]["pages"] != 1 && page_counter <= results_characters["info"]["pages"] do
        request_ch = next_p
        body_ch = HTTP.get(request_ch).body
        r = JSON.parse(body_ch)
        r["results"].each do |rch|
          aux = [rch["id"],rch["name"]]
          @results_characters << aux
        end
        next_p = r["info"]["next"]
      end
    end

########################################locaciones##############################

    request_l = "https://rickandmortyapi.com/api/location/?name="+ @search.to_s
    body_l = HTTP.get(request_l).body
    results_locations = JSON.parse(body_l)
    @results_locations = []
    @found_l = TRUE
    if results_locations["error"]
      @found_l = FALSE
    else
      page_counter = 1
      results_locations["results"].each do |rl|
        aux = [rl["id"],rl["name"]]
        @results_characters << aux
      end
      next_p = results_locations["info"]["next"]
      while next_p && results_locations["info"]["pages"] != 1 && page_counter <= results_locations["info"]["pages"] do
        request_l = next_p.to_s
        body_l = HTTP.get(request_l).body
        r = JSON.parse(body_l)
        r["results"].each do |rl|
          aux = [rl["id"],rl["name"]]
          @results_characters << aux
        end
        next_p = r["info"]["next"]
      end
    end




  end
end
