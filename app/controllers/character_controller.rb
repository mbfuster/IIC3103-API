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
    ch_ep_ids = ""
    results["episode"].each do |q|
      q.slice!("https://rickandmortyapi.com/api/episode/")
      ch_ep_ids += q + ","
    end

    int = ch_ep_ids.length - 2
    ch_ep_ids = ch_ep_ids[0..int]
    ep_body =  HTTP.get("https://rickandmortyapi.com/api/episode/" + ch_ep_ids).body
    ch_r = JSON.parse(ep_body)

    if ch_r.instance_of?Array
      ch_r.each do |chr|
        aux = [chr["id"],chr["name"]]
        @character_episodes << aux
      end
    else
      aux = [ch_r["id"],ch_r["name"]]
      @character_episodes << aux
    end
  end
end
