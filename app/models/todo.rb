class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :due_date, presence: true

  belongs_to :user

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
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
end
