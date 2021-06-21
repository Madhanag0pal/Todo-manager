class TodoWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(todo_id)
    todo = Todo.find(todo_id)
    puts "A new Todo '#{todo.todo_text}' added by '#{todo.user}'"
  end
end
