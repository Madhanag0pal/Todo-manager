class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.join("\n")
  end

  def show
    render plain: User.find(params[:id])
  end

  def new
    render "users/new"
  end

  def update
    user = User.find(params[:id])
    user.name = params[:name]
    user.email = params[:email]
    user.password = digest(params[:password])
    user.save!
    render plain: "Updated user to #{user}"
  end

  def create
    newUser = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
    )
    redirect_to "/"
  end

  def login
    user = User.find_by(email: params[:email])
    if user
      render plain: user.password == params[:password]
    else
      render plain: "email \"#{params[:email]}\" does not exitst"
    end
  end
end
