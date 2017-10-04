class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:venue]
      venue = Venue.find_by(email: params[:session][:email].downcase)
      if venue && venue.authenticate(params[:session][:password])
        venue_log_in venue
        redirect_to venue
      else
        flash[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
