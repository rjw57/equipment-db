class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:password] == 'mak3spac3'
      session[:user_id] = 1
      redirect_to home_url, :status => 303
    end
  end
end