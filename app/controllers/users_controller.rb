class UsersController < ApplicationController
  skip_before_action :ensuer_user_logged_in

  def new
  end

  def update
    User.update(params[:id], name: params[:name], email: params[:email], password: params[:password])
    user.save!
    render plain: "Updated user to #{user}"
  end

  def create
    new_user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
