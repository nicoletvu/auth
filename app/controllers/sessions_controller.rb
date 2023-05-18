class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user != nil  
    # 3. if they know their password -> login is successful
      if BCrypt::Password.new(@user["password"]) == params["password"]
        flash["notice"] = "Welcome!"
        redirect_to "/companies"
    # 4. if the email does not exist or they do not know their password -> login fails
      else 
        flash["notice"] = "Nope."
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/sessions/new"
  end
end
