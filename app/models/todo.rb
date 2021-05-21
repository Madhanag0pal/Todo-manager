class Todo < ActiveRecord::Base
  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    "#{id}. #{display_status} #{due_date.to_s(:long)} #{todo_text} "
  end
end
