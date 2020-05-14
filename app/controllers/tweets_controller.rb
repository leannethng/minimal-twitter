class TweetsController < ApplicationController
  before_action :auth_params, only: %i[login index]

  def index
    if session[:token].present?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = Rails.application.credentials.twitter[:TWITTER_KEY]
        config.consumer_secret = Rails.application.credentials.twitter[:TWITTER_SECRET]
        config.access_token = session[:token]
        config.access_token_secret = session[:token_secret]
      end
    @tweets = client.home_timeline
    end  
  end


  def login
    session[:username] = @response[:info][:nickname]
    session[:token] = @response[:credentials][:token]
    session[:token_secret] = @response[:credentials][:secret]
    redirect_to "/"
  end

  def logout
    reset_session
    redirect_to "/"
  end  


  protected

    def auth_params
      # session is a key word in ruby
      @response = request.env['omniauth.auth']
    end  
end
