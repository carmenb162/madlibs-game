Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'application#home'

  get 'home' => 'default#home'

  get 'finished_story' =>'default#finished_story'

  # post 'home' => 'dictionary#submit_ten_words'

  post 'submit_ten_words' => 'dictionary#submit_ten_wordsies'



end
