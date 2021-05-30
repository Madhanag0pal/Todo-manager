class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
  end

  def show
    todo = Todo.find(params[:id])
    render plain: todo.to_displayable_string
  end

  def update
    todo = Todo.find(params[:id])
    todo.completed = params[:completed]
    todo.save!
    redirect_to todos_path
  end

  def create
    newTodo = Todo.create!(
      todo_text: params[:todo_text],
      due_date: DateTime.parse(params[:due_date]),
      completed: false,
    )
    redirect_to todos_path
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to todos_path
  end

  def login
    user = User.find_by(email: params[:email])
    render plain: !!user && user.password == params[:password]
  end
end
