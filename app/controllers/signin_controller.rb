class SigninController < ApplicationController
  before_filter :setup_vars

  def setup_vars
    @user_list = User.find(:all, :conditions => {:is_there => true})
  end

  def index
    @user_list
  end

  def signin
    @user = User.find(:last, :conditions => {:nick => params[:user][:nick]})
    if not @user
      @user = User.new
      @user.nick = params[:user][:nick]
    end
    @user.is_there = !@user.is_there
    @user.save if params[:user][:nick] # Don't save user if no nick is given

    #render :text => "You've signed in, #{@user.nick}!#{params.inspect}"
    # flash = {:success => "You've signed in, #{@user.nick}!",
    #          :error => "Something bad happened... blame Steve"}
    redirect_to :action => "index"
  end
end
