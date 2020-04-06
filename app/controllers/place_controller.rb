class PlaceController < ApplicationController
  def show
    @location_id = params[:id]
    request = "https://rickandmortyapi.com/api/location/"+ @location_id.to_s
    body = HTTP.get(request).body
    results = JSON.parse(body)
    @location_results = results
    @location_residents = []
    res_ids = ""
    @location_results["residents"].each do |q|
      q.slice!("https://rickandmortyapi.com/api/character/")
      res_ids += q + ","
    end

    int = res_ids.length - 2
    res_ids = res_ids[0..int]
    body_r =  HTTP.get("https://rickandmortyapi.com/api/character/"+res_ids).body
    r_r = JSON.parse(body_r)

    if r_r.instance_of?Array
      r_r.each do |rr|
        aux = [rr["id"],rr["name"]]
        @location_residents<< aux
      end
    else
      aux = [r_r["id"],r_r["name"]]
      @location_residents<< aux
    end
  end
end
