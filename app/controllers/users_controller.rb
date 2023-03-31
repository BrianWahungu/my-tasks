class UsersController < ApplicationController

  before_action :session_expired?, only: [:check_login_status] 

  def create
    user = User.create(user_params)
    if user.valid?
        save_user(user.id)
        app_response(message: 'Registration was succesful',status: :created, data: user) 
    else
        app_response(message: 'Something went wrong during registration',status: :unprocessable_entity, data: user.errors)
    end
  end

  def login
    sql = "username = :username OR email = :email"
    user = User.where(sql, { username: user_params[:username], email: user_params[:email] }).first
    if user&.authenticate(user_params[:password])
        save_user(user.id)
        app_response(message: 'Login was successful', status: :ok, data: user)
    else
        app_response(message: 'Invalid username/email or password', status: :unauthorized)
    end
  end
  
  def logout
    remove_user
    app_response(message: 'Logout successful')
  end

  def check_login_status
    if current_user
      app_response(message: 'User is logged in', status: :ok)
    else
      app_response(message: 'User is not logged in', status: :unauthorized)
    end
  end
  
  
  def index
    @users = User.all
    render json: @users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     render json: { message: 'User created successfully' }, status: :created
  #   else
  #     render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end
    
private
    
def user_params
  params.permit(:username, :email, :password)
end
end
