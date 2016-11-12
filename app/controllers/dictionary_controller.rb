class DictionaryController < ApplicationController


  def search_in_dictionary

  end

  def submit_ten_wordsies
    # This action is triggered from POST request from submit button of form in path home.
    # home has 10 user input field.  These 10 fields are params, and their names are all
    # stored in the array words_to_check

    words_to_check = [:verb1, :noun1, :noun2, :noun3, :noun4, :adjective1, :adjective2, :adjective3, :adjective4, :adverb1 ]

    @testing = []

    words_to_check.each do |x|
      url ="http://api.wordnik.com/v4/word.json/#{params[x]}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=f8e9e641abd36ff28800f0f1a3706857805d1fa5d47771f81"
      # Use string interpolation to interate through the array of params that we got from user on the home path
      # for each of the params, put it into the path to ping it against the Wordnik API

      response = HTTParty.get(url)
      api_response = JSON.parse(response.body)
        # Take the response from Wordnik API and parse it
      filtered_results = api_response.map do |datum|
        datum['partOfSpeech']
          # get the part of speech from the API response for the given word
      end
      t = filtered_results.uniq.map do |attr|
          # define variable t as a map method in which we take only the unique
          # instances of part of speech from that API response
        attr if attr.include? x[0...-1]
          # because the params' symbols were strategically named by the part of speech requested
          # of the user followed by one-char long integer, here to identify which part of speech
          # we are looking for in the response to validate against whether the user actually provided the
          # requested part of speech, we basically say "look at the param's name up until the last character"
          # therefore, the param verb1 becomes 'verb,' the param adjective4 becomes 'adjective,' etc.
      end.compact.length
          # take the return of all that, push it together, and spit out the length of that string
     @testing << (t > 0)
          # if that string's length is > 0, that means that there is a definition of the user's
          # provided word -- meaning, the user provided a real word.
          # then, shove value into array @testing
    end


    if @testing.include? false
        # if the array @testing contains a single instance of the word "false," we don't want to move to the
        # completed view... instead, we want to keep the user at the page and have them
        # provide a word of the correct part of speech

    # render "default/home"
          #The render code above works, but it clears all the previous input in the fields.
          #Annoying and can't figure out how to prevent that...  So, tried to use the flash.now thing below...

    # flash.now[:notice] = 'One of your words is the wrong part of speech!'
        # This triggers, but it doesn't display a message box...  It just makes
        # the browser window go blank.  :(  Still need.

    else
      render "default/finished_story"
        # This works!  takes user to the finished_story page and uses string interpolation to enter in the
        # 10 words provided by the user
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
