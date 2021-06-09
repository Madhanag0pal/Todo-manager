class User < ActiveRecord::Base
  has_secure_password

  def to_s
    "#{id} #{first_name} #{last_name} #{email}"
  end
end
