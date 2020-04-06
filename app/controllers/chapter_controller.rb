class ChapterController < ApplicationController
  def show
    @chapter_info = params[:id]
    @url = "https://integracion-rick-morty-api.herokuapp.com/api/"
    request = @url + "episode/"+ @chapter_info.to_s
    body = HTTP.get(request).body
    results = JSON.parse(body)
    @chapter_result = results
    i = 0
    @episode_characters = []

    res_ids = ""
    @chapter_result["characters"].each do |q|
      q.slice!(@url + "character/")
      res_ids += q + ","
    end

    int = res_ids.length - 2
    res_ids = res_ids[0..int]
    puts "--------------------------------------------------------------------"
    puts res_ids
    body_r =  HTTP.get(@url + "character/"+res_ids).body
    r_r = JSON.parse(body_r)

    if r_r.instance_of?Array
      r_r.each do |rr|
        aux = [rr["id"],rr["name"]]
        @episode_characters<< aux
      end
    else
      aux = [r_r["id"],r_r["name"]]
      @episode_characters<< aux
    end
  end
end
