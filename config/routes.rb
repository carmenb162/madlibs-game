Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'application#home'

  get 'home' => 'default#home'

  get '/'  => 'default#home'

  get 'submit_ten_words' => 'default#finished_story'

  post 'submit_ten_words' => 'dictionary#submit_ten_wordsies'

  # get 'finished_story' =>'default#finished_story'


end
