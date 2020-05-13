class TweetsController < ApplicationController
 

  def index
    # @tweets = Tweet.all
  end


  def login
    @response = request.env['omniauth.auth']
    # session is a key word in ruby
    session[:username] = @response[:info][:nickname]
    session[:token] = @response[:credentials][:token]
    session[:token_secret] = @response[:credentials][:secret]

    redirect_to "/"
  end
end
