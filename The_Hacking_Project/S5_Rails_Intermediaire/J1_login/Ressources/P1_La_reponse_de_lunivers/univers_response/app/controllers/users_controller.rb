class UsersController < ApplicationController

      def index
          @users = User.all
      end

      def show
          @user = User.find(params[:id])
      end

      def new
          @user = User.new
      end

      def create
          @user = User.new(params[:id])
          if @user.save
             redirect_to @user
          else
            render 'new'
          end
      end

      def edit
          @user = User.find(params[:id])
      end

      def show
          @user = User.find(params[:id])
      end

      def update
          @user = User.find(params[:id])
          if @user.update(params[:id])
             redirect_to users_path
          else
             render 'edit'
          end
      end


      def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
      end




      # def setup
      #     @user = User.new(name: "Example User", email: "user@example.com")
      # end

end
