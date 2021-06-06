class CreateTodo < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :todo_text
      t.date :due_date
      t.boolean :completed
      t.bigint :user_id
    end
  end
end
