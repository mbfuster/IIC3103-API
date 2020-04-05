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

    res_ids.slice!(res_ids[-1])
    puts "--------------------------------------------------------------------"
    puts res_ids
    body_r =  HTTP.get("https://rickandmortyapi.com/api/character/"+res_ids).body
    r_r = JSON.parse(body_r)
    r_r.each do |rr|
      aux = [rr["id"],rr["name"]]
      @location_residents<< aux
    end

  end
end
