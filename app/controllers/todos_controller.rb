class TodosController < ApplicationController
  def index
    current_user
  end

  def show
    Todo.find(params[:id])
    render plain: todo.to_displayable_string
  end

  def update
    Todo.update(params[:id], completed: params[:completed])
    redirect_to todos_path
  end

  def create
    Todo.create!(
      todo_text: params[:todo_text],
      due_date: DateTime.parse(params[:due_date]),
      completed: false,
      password: params[:password],
    )
    redirect_to todos_path
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end

  def login
    user = User.find_by(email: params[:email])
    render plain: !!user && user.password == params[:password]
  end
end
