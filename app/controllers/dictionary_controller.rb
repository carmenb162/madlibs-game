class DictionaryController < ApplicationController


  def search_in_dictionary

  end

  def submit_ten_words

    words_to_check = [:verb1, :noun1, :noun2, :noun3, :noun4, :adjective1, :adjective2, :adjective3, :adjective4, :adverb1 ]
    @testing = []

    words_to_check.each do |x|
      url ="http://api.wordnik.com/v4/word.json/#{params[x]}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=f8e9e641abd36ff28800f0f1a3706857805d1fa5d47771f81"

      response = HTTParty.get(url)
      api_response = JSON.parse(response.body)
      filtered_results = api_response.map do |datum|
        datum['partOfSpeech']
      end
      t = filtered_results.uniq.map do |attr|
        attr if attr.include? x[0...-1]
      end.compact.length
     @testing << (t > 0)
    end


    if @testing.include? false
       render home_url
      # "oh no!"
    else
      redirect_to finished_story_url
      @verb1 = params[:verb1]
    end
  end



  #   url = "http://api.wordnik.com/v4/word.json/#{params[:verb1]}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=f8e9e641abd36ff28800f0f1a3706857805d1fa5d47771f81"
   #
  #   response = HTTParty.get(url)
  #   api_response = JSON.parse(response.body)
  #   filtered_results = api_response.map do |datum|
  #     datum['partOfSpeech']
  #   end
  #   t = filtered_results.uniq.map do |attr|
  #     attr if attr.include? 'verb'
  #   end.compact.length
  #  t > 0



  end
