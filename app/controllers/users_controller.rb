class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
     @user = User.find(params[:id])
     @user_events = UserEvent.where(user_id: @user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Open Mic"
      # This should eventually link to the event show page.
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    session[:user_id] = nil
    redirect_to root_path
  end


  private

 def user_params
   params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
 end

end
