class UsersController < ApplicationController

  def edit
      @user = User.find(1)
  end


  def new
      @user= User.new
                               #l'appeler user facilite le code(eviter de renommer user[attr] par xxx[attr])
  end


  def create
      # @utilisateur = User.new  params[:user]          <---voir pk dont work    #code pouvant etre simplifier en mettant user à la place de @utilistaeur dans view aussi et aussi nom attribe tel qu'il soient identique à ceux de la classe
      # @utilisateur.username = user_params[:name_user]
      # @utilisateur.email = user_params[:the_email]
      # @utilisateur.bio = user_params[:the_bio]

       @user= User.new
       @user.username = params[:user][:username]
       @user.email    = params[:user][:email]
       @user.bio      = params[:user][:bio]
       @user.save

      if @user.save                                             #@utilisateur.save
        redirect_to new_user_path
      else
        render 'new'                                             #'new':=>vers l'action de la route (url)     new:=> vers la methode
      end

  end

  def update
  end

#version 2
  private

  def user_params
    params.require(:user).permit(:name_user, :the_email, :the_bio)
  end
end
