class CharacterController < ApplicationController
  def show
    @character_id = params[:id]
    request = "https://rickandmortyapi.com/api/character/"+ @character_id.to_s
    body = HTTP.get(request).body
    results = JSON.parse(body)
    @character_result = results


    if !results["origin"]["url"].empty?
      origin_body = HTTP.get(results["origin"]["url"]).body
      ob = JSON.parse(origin_body)
      @character_origin = ob
    else
      @no_origin = TRUE
    end

    if !results["location"]["url"].empty?
      location_body = HTTP.get(results["location"]["url"]).body
      lb = JSON.parse(location_body)
      @character_location = lb
    else
      @no_location = TRUE
    end

    @character_episodes = []
    results["episode"].each do |e|
      body =  HTTP.get(e).body
      r = JSON.parse(body)
      aux = [r["id"],r["name"]]
      @character_episodes << aux
    end

  end
end
