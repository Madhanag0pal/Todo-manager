class TodosController < ApplicationController
  def index
    @todos = current_user.todos
  end

  def update
    todo = Todo.where(id: params[:id], user_id: current_user.id)
    if todo
      todo.update(completed: params[:completed])
    end
    redirect_to todos_path
  end

  def create
    new_todo = Todo.new(
      todo_text: params[:todo_text],
      due_date: params[:due_date],
      completed: false,
      user_id: current_user.id,
    )
    unless new_todo.save
      flash[:error] = new_todo.errors.full_messages.join(", ")
    end
    redirect_to todos_path
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end
end
