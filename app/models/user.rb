class User < ActiveRecord::Base
  has_secure_password

  def to_s
    "#{id} #{name} #{email} #{password}"
  end
end
