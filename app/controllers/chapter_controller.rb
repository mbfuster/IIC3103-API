class ChapterController < ApplicationController
  def show
    @chapter_info = params[:id]
    request = "https://rickandmortyapi.com/api/episode/"+ @chapter_info.to_s
    body = HTTP.get(request).body
    results = JSON.parse(body)
    @chapter_result = results
    i = 0
    @episode_characters = []

    @chapter_result["characters"].each do |q|
      body =  HTTP.get(q).body
      r = JSON.parse(body)
      aux = [r["id"],r["name"]]
      @episode_characters << aux
    end

  end
end
