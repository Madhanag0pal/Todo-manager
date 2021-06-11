class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :todos, dependent: :destroy

  def to_s
    "#{id} #{first_name} #{last_name} #{email}"
  end
end
