class ChapterController < ApplicationController
  def show
    @chapter_info = params[:id]
    request = "https://rickandmortyapi.com/api/episode/"+ @chapter_info.to_s
    body = HTTP.get(request).body
    results = JSON.parse(body)
    @chapter_result = results
    i = 0
    @episode_characters = []

    res_ids = ""
    @chapter_result["characters"].each do |q|
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
      @episode_characters<< aux
    end

  end
end
