class PlaceController < ApplicationController
  def show
    @location_id = params[:id]
    request = "https://rickandmortyapi.com/api/location/"+ @location_id.to_s
    body = HTTP.get(request).body
    results = JSON.parse(body)
    @location_results = results
    @location_residents = []
    @location_results["residents"].each do |q|
      body =  HTTP.get(q).body
      r = JSON.parse(body)
      aux = [r["id"],r["name"]]
      @location_residents << aux
    end
  end
end
