class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.join("\n")
  end

  def show
    render plain: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.save!
    render plain: "Updated user to #{user}"
  end

  def create
    newUser = User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:Password],
    )
    render plain: "new user is created with id  #{newUser.id}"
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
