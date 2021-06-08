class Todo < ActiveRecord::Base
  # belongs_to :user

  def self.add_task(h)
    create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed(status = true)
    all.where(completed: status)
  end

  def self.mark_as_complete!(id, completed)
    update(id, completed: completed)
  end
end
