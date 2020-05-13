class TweetsController < ApplicationController
  before_action :auth_params, only: %i[login]

  def index
    # @tweets = Tweet.all
  end


  def login
    
    redirect_to "/"
  end


  private

    def auth_params
      # session is a key word in ruby
      @response = request.env['omniauth.auth']
      session[:username] = @response[:info][:nickname]
      session[:token] = @response[:credentials][:token]
      session[:token_secret] = @response[:credentials][:secret]
    end  
end
