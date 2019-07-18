class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def index 

        @users = User.all

    end 

    def update 

        @user = User.find(params[:id])

        @user.attributes = user_params

        if @user.save
            redirect_to users_path
        else 
            render :new
        end
    end 

    def create

        @user = User.new(user_params)
      
        if @user.save
          redirect_to new_user_path
        else
          render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end
  

    private 

        def user_params
            params.require(:user).permit(:username,:email,:password)
        end 

    
end
