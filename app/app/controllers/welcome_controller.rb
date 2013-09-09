class WelcomeController < ApplicationController
  def index
    if rand(10) < 2
      raise 'error'
    else
      sleep rand(10) / 100.0
      render text: 'ok'
    end
  end
end
